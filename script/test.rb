require 'nkf'

def index_directory(stor, dir)
	puts "scanning: " + dir

	searchExts = "ts,mp4,mkv,iso,mpg,wmv,avi,mpeg"
	log_dir = "/mnt/record/Record/_log/"

	ItemFile.check_deleted_or_modified(stor, dir)

	# scan new files
	Dir[stor.path + dir + "/*.{" + searchExts + "}"].each do |filepath|
		filename = File.basename(filepath)
		filesize = File.size(filepath)
		file_created = File.ctime(filepath)
		file_updated = File.mtime(filepath)
		file_format = File.extname(filepath).upcase
		file_format = file_format.slice(1, file_format.length-1)
		file_hash = ""

		#mached_files = Item.where(filename:File.basename(filename)).first.item_file.where(storage_id:stor.id, directory:dir)
		mached_files = ItemFile.where_by_filename_with_storage_and_directory(stor, dir, filename)


		if mached_files.length == 0 then
			mached_items = Item.where(
								filename: filename, 
								file_size: filesize,
								file_created_at: file_created, 
								file_updated_at: file_updated )

			if mached_items.length == 0 then
				puts "new: " + filename

				title = filename
				subtitle =""
				number = 0
				duration_sec = 0
				released_at = nil
				description = ""
				log = ""
				flag = 0

				prop = Hash.new

				if file_format == "TS" then
					# TV recorded TS file
					file_format = "MPEG2-TS"

					# parse recorded filename, example: "[NHK] HogeHoge (2013-01-23).ts"
					if /\[(.+)\] (.+) \((\d\d\d\d-\d\d\-\d\d)\).*\.ts/ =~ filename then
						prop[:tv_channel] = NKF::nkf('-WwZ1', $1)
						title = $2
						released_at = DateTime.parse($3)
					end

					# read tv-program file
					desc_filename = log_dir + filename + ".program.txt"
					File.open(desc_filename, 'r:cp932:utf-8') do |io|
						description = io.read
					end if File.exists?(desc_filename)

					# read tv-err file
					log_filename = log_dir + filename + ".err"
					File.open(log_filename, 'r:cp932:utf-8') do |io|
							log = io.read
						end if File.exists?(log_filename) 

					# ToDo: get duration_sec from ffmpeg

					# ToDo: parse number, example: '第1話', '第一話', "#1", etc...

				end

				new_item = Item.new(
								filename: filename, 
								file_size: filesize, 
								file_created_at: file_created, 
								file_updated_at: file_updated, 
								file_hash: file_hash, 
								format: file_format, 
								title: title, 
								subtitle: subtitle, 
								number: number, 
								released_at: released_at, 
								duration_sec: duration_sec, 
								description: description, 
								log: log, 
								flag: flag )

				unless new_item.save then
					raise "Item save error: " + filename
				end

				new_file = ItemFile.new(
								item_id: new_item.id, 
								storage_id: stor.id, 
								directory: dir, 
								flag: 0 )

				unless new_file.save then
					raise "ItemFile save error: " + filename
				end


				prop.each do |k, v|
					pp = ItemProp.new(
						item_id: new_item.id,
						name: k,
						value: v)

					unless pp.save then
						raise "ItemProp save error: " + filename
					end
				end

				

			elsif mached_items.length == 1 then
				puts "clone: " + filename

				new_file = ItemFile.new(
								item_id: mached_items[0].id, 
								storage_id: stor.id, 
								directory: dir, 
								flag: 0 )


				unless new_file.save then
					raise "ItemFile save error: " + filename
				end
				
								
			else
				raise "consistency error : " + filename
			end

		elsif mached_files.length == 1 then
			mached_files[0]
			# ToDo: check consistensy
			# filesize, timestamp must matches to table

		else
			raise "error: " + filename
		end
	end

	# scan sub directory recursively
	Dir[stor.path + dir + "/*/"].each do |sub_dir|
		if File.basename(sub_dir)[0] != "_" then	# ignore _HOGE folders
			index_directory(stor, dir + "/" + File.basename(sub_dir))
		end
	end
end


def index_storage(stor)
	index_directory(stor, "")
end



Storage.find(:all).each do |stor|
	index_storage stor
end


