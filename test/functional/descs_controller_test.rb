require 'test_helper'

class DescsControllerTest < ActionController::TestCase
  setup do
    @desc = descs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:descs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create desc" do
    assert_difference('Desc.count') do
      post :create, desc: { description: @desc.description, phase_state: @desc.phase_state, star_state: @desc.star_state }
    end

    assert_redirected_to desc_path(assigns(:desc))
  end

  test "should show desc" do
    get :show, id: @desc
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @desc
    assert_response :success
  end

  test "should update desc" do
    put :update, id: @desc, desc: { description: @desc.description, phase_state: @desc.phase_state, star_state: @desc.star_state }
    assert_redirected_to desc_path(assigns(:desc))
  end

  test "should destroy desc" do
    assert_difference('Desc.count', -1) do
      delete :destroy, id: @desc
    end

    assert_redirected_to descs_path
  end
end
