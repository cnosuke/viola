require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  setup do
    @item = items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item" do
    assert_difference('Item.count') do
      post :create, item: { description: @item.description, directory: @item.directory, duration_sec: @item.duration_sec, file_created_at: @item.file_created_at, file_updated_at: @item.file_updated_at, filename: @item.filename, format: @item.format, log: @item.log, number: @item.number, released_at: @item.released_at, size: @item.size, storage_id: @item.storage_id, subtitle: @item.subtitle, title: @item.title }
    end

    assert_redirected_to item_path(assigns(:item))
  end

  test "should show item" do
    get :show, id: @item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item
    assert_response :success
  end

  test "should update item" do
    patch :update, id: @item, item: { description: @item.description, directory: @item.directory, duration_sec: @item.duration_sec, file_created_at: @item.file_created_at, file_updated_at: @item.file_updated_at, filename: @item.filename, format: @item.format, log: @item.log, number: @item.number, released_at: @item.released_at, size: @item.size, storage_id: @item.storage_id, subtitle: @item.subtitle, title: @item.title }
    assert_redirected_to item_path(assigns(:item))
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete :destroy, id: @item
    end

    assert_redirected_to items_path
  end
end
