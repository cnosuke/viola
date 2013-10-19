class ItemPropsController < ApplicationController
  before_action :set_item_prop, only: [:show, :edit, :update, :destroy]

  # GET /item_props
  # GET /item_props.json
  def index
    @item_props = ItemProp.all
  end

  # GET /item_props/1
  # GET /item_props/1.json
  def show
  end

  # GET /item_props/new
  def new
    @item_prop = ItemProp.new
  end

  # GET /item_props/1/edit
  def edit
  end

  # POST /item_props
  # POST /item_props.json
  def create
    @item_prop = ItemProp.new(item_prop_params)

    respond_to do |format|
      if @item_prop.save
        format.html { redirect_to @item_prop, notice: 'Item prop was successfully created.' }
        format.json { render action: 'show', status: :created, location: @item_prop }
      else
        format.html { render action: 'new' }
        format.json { render json: @item_prop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_props/1
  # PATCH/PUT /item_props/1.json
  def update
    respond_to do |format|
      if @item_prop.update(item_prop_params)
        format.html { redirect_to @item_prop, notice: 'Item prop was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @item_prop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_props/1
  # DELETE /item_props/1.json
  def destroy
    @item_prop.destroy
    respond_to do |format|
      format.html { redirect_to item_props_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_prop
      @item_prop = ItemProp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_prop_params
      params.require(:item_prop).permit(:item_id, :name, :value)
    end
end
