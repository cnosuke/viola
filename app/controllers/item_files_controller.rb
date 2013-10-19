class ItemFilesController < ApplicationController
  before_action :set_item_file, only: [:show, :edit, :update, :destroy]

  # GET /item_files
  # GET /item_files.json
  def index
    @item_files = ItemFile.all
  end

  # GET /item_files/1
  # GET /item_files/1.json
  def show
  end

  # GET /item_files/new
  def new
    @item_file = ItemFile.new
  end

  # GET /item_files/1/edit
  def edit
  end

  # POST /item_files
  # POST /item_files.json
  def create
    @item_file = ItemFile.new(item_file_params)

    respond_to do |format|
      if @item_file.save
        format.html { redirect_to @item_file, notice: 'Item file was successfully created.' }
        format.json { render action: 'show', status: :created, location: @item_file }
      else
        format.html { render action: 'new' }
        format.json { render json: @item_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_files/1
  # PATCH/PUT /item_files/1.json
  def update
    respond_to do |format|
      if @item_file.update(item_file_params)
        format.html { redirect_to @item_file, notice: 'Item file was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @item_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_files/1
  # DELETE /item_files/1.json
  def destroy
    @item_file.destroy
    respond_to do |format|
      format.html { redirect_to item_files_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_file
      @item_file = ItemFile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_file_params
      params.require(:item_file).permit(:item_id, :storage_id, :directory, :flag)
    end
end
