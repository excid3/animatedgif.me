require 'test_helper'

class GifsControllerTest < ActionController::TestCase
  setup do
    @gif = gifs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gifs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gif" do
    assert_difference('Gif.count') do
      post :create, gif: { url: @gif.url }
    end

    assert_redirected_to gif_path(assigns(:gif))
  end

  test "should show gif" do
    get :show, id: @gif
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gif
    assert_response :success
  end

  test "should update gif" do
    patch :update, id: @gif, gif: { url: @gif.url }
    assert_redirected_to gif_path(assigns(:gif))
  end

  test "should destroy gif" do
    assert_difference('Gif.count', -1) do
      delete :destroy, id: @gif
    end

    assert_redirected_to gifs_path
  end
end
