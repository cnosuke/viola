class ItemThumbnailsController < ApplicationController
  before_action :set_item_thumbnail, only: [:show, :edit, :update, :destroy]

  # GET /item_thumbnails
  # GET /item_thumbnails.json
  def index
    @item_thumbnails = ItemThumbnail.all
  end

  # GET /item_thumbnails/1
  # GET /item_thumbnails/1.json
  def show
  end

  # GET /item_thumbnails/new
  def new
    @item_thumbnail = ItemThumbnail.new
  end

  # GET /item_thumbnails/1/edit
  def edit
  end

  # POST /item_thumbnails
  # POST /item_thumbnails.json
  def create
    @item_thumbnail = ItemThumbnail.new(item_thumbnail_params)

    respond_to do |format|
      if @item_thumbnail.save
        format.html { redirect_to @item_thumbnail, notice: 'Item thumbnail was successfully created.' }
        format.json { render action: 'show', status: :created, location: @item_thumbnail }
      else
        format.html { render action: 'new' }
        format.json { render json: @item_thumbnail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_thumbnails/1
  # PATCH/PUT /item_thumbnails/1.json
  def update
    respond_to do |format|
      if @item_thumbnail.update(item_thumbnail_params)
        format.html { redirect_to @item_thumbnail, notice: 'Item thumbnail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @item_thumbnail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_thumbnails/1
  # DELETE /item_thumbnails/1.json
  def destroy
    @item_thumbnail.destroy
    respond_to do |format|
      format.html { redirect_to item_thumbnails_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_thumbnail
      @item_thumbnail = ItemThumbnail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_thumbnail_params
      params.require(:item_thumbnail).permit(:item_id, :time_sec, :image_filename)
    end
end
