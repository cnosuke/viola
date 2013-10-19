require 'test_helper'

class ItemTagsControllerTest < ActionController::TestCase
  setup do
    @item_tag = item_tags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item_tag" do
    assert_difference('ItemTag.count') do
      post :create, item_tag: { item_id: @item_tag.item_id, tag: @item_tag.tag }
    end

    assert_redirected_to item_tag_path(assigns(:item_tag))
  end

  test "should show item_tag" do
    get :show, id: @item_tag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item_tag
    assert_response :success
  end

  test "should update item_tag" do
    patch :update, id: @item_tag, item_tag: { item_id: @item_tag.item_id, tag: @item_tag.tag }
    assert_redirected_to item_tag_path(assigns(:item_tag))
  end

  test "should destroy item_tag" do
    assert_difference('ItemTag.count', -1) do
      delete :destroy, id: @item_tag
    end

    assert_redirected_to item_tags_path
  end
end
