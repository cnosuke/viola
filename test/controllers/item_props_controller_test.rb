require 'test_helper'

class ItemPropsControllerTest < ActionController::TestCase
  setup do
    @item_prop = item_props(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_props)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item_prop" do
    assert_difference('ItemProp.count') do
      post :create, item_prop: { item_id: @item_prop.item_id, name: @item_prop.name, value: @item_prop.value }
    end

    assert_redirected_to item_prop_path(assigns(:item_prop))
  end

  test "should show item_prop" do
    get :show, id: @item_prop
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item_prop
    assert_response :success
  end

  test "should update item_prop" do
    patch :update, id: @item_prop, item_prop: { item_id: @item_prop.item_id, name: @item_prop.name, value: @item_prop.value }
    assert_redirected_to item_prop_path(assigns(:item_prop))
  end

  test "should destroy item_prop" do
    assert_difference('ItemProp.count', -1) do
      delete :destroy, id: @item_prop
    end

    assert_redirected_to item_props_path
  end
end
