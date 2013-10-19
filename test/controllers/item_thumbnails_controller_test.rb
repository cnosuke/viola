require 'test_helper'

class ItemThumbnailsControllerTest < ActionController::TestCase
  setup do
    @item_thumbnail = item_thumbnails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_thumbnails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item_thumbnail" do
    assert_difference('ItemThumbnail.count') do
      post :create, item_thumbnail: { image_filename: @item_thumbnail.image_filename, item_id: @item_thumbnail.item_id, time_sec: @item_thumbnail.time_sec }
    end

    assert_redirected_to item_thumbnail_path(assigns(:item_thumbnail))
  end

  test "should show item_thumbnail" do
    get :show, id: @item_thumbnail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item_thumbnail
    assert_response :success
  end

  test "should update item_thumbnail" do
    patch :update, id: @item_thumbnail, item_thumbnail: { image_filename: @item_thumbnail.image_filename, item_id: @item_thumbnail.item_id, time_sec: @item_thumbnail.time_sec }
    assert_redirected_to item_thumbnail_path(assigns(:item_thumbnail))
  end

  test "should destroy item_thumbnail" do
    assert_difference('ItemThumbnail.count', -1) do
      delete :destroy, id: @item_thumbnail
    end

    assert_redirected_to item_thumbnails_path
  end
end
