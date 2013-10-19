


def updateIndexDirectory(stor, dir)
	puts "scanning: " + dir

	searchExts = "ts,mp4,mkv,iso,mpg,wmv,avi,mpeg"

	# check indexed files is deleted or modified
	ItemFile.where(storage_id:stor.id).where(directory:dir).each do |item_file|
		filename = item_file.item.filename
		filepath = stor.path + item_file.directory + "/" + filename
		if File.exists?(filepath) then
			if File.size(filepath) != item_file.item.file_size then	# ToDo: check timestamps
				puts "modified: " + filename
			else
				puts "OK: " + filename
			end
		else
			puts "missing: " + filename
		end
	end

	# scan new files
	Dir[stor.path + dir + "/*.{" + searchExts + "}"].each do |filepath|
		filename = File.basename(filepath)
		filesize = File.size(filepath)
		file_created = File.ctime(filepath)
		file_updated = File.mtime(filepath)

		# Item.where(filename:File.basename(filename)).first.item_file.where(storage_id:stor.id, directory:dir)
		mached_files = ItemFile.includes(:item).where(storage_id:stor.id, directory:dir).where("items.filename = ?", filename)
		if mached_files.length == 0 then
			mached_items = Item.where(filename:filename, file_size:filesize)	# ToDo: check timestamp
			if mached_items.length == 0 then
				new_item = Item.new(filename:filename, file_size:filesize, file_created_at:file_created, file_updated_at:file_updated, file_hash:"", format:File.extname(filepath), title:filename, subtitle:"", number:0, released_at:nil, duration_sec:0, description:"", log:"", flag:0)
				if new_item.save then
					new_file = ItemFile.new(item_id:new_item.id, storage_id:stor.id, directory:dir, flag:0)
					if new_file.save then
						puts "new: " + filename
					else
						puts "save error: " + filename
					end
				else
					puts "save error: " + filename
				end
			elsif mached_items.length == 1 then
				new_file = ItemFile.new(item_id:mached_items[0].id, storage_id:stor.id, directory:dir, flag:0)
				if new_file.save then
					puts "clone: " + filename					
				else
					puts "save error: " + filename
				end
			else
				puts "consistency error : " + filename
			end
		else
			# ToDo: check consistensy
			# filesize, timestamp must matches to table
		end
	end

	Dir[stor.path + dir + "/*/"].each do |sub_dir|
		updateIndexDirectory(stor, dir + "/" + File.basename(sub_dir))
	end
end


def updateIndexStorage(stor)
	updateIndexDirectory(stor, "")
end


Storage.find(:all).each do |stor|
	updateIndexStorage stor
end
