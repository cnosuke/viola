require 'test_helper'

class ItemFilesControllerTest < ActionController::TestCase
  setup do
    @item_file = item_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item_file" do
    assert_difference('ItemFile.count') do
      post :create, item_file: { directory: @item_file.directory, flag: @item_file.flag, item_id: @item_file.item_id, storage_id: @item_file.storage_id }
    end

    assert_redirected_to item_file_path(assigns(:item_file))
  end

  test "should show item_file" do
    get :show, id: @item_file
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item_file
    assert_response :success
  end

  test "should update item_file" do
    patch :update, id: @item_file, item_file: { directory: @item_file.directory, flag: @item_file.flag, item_id: @item_file.item_id, storage_id: @item_file.storage_id }
    assert_redirected_to item_file_path(assigns(:item_file))
  end

  test "should destroy item_file" do
    assert_difference('ItemFile.count', -1) do
      delete :destroy, id: @item_file
    end

    assert_redirected_to item_files_path
  end
end
