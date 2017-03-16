require 'test_helper'

class CurrentWaitTimesControllerTest < ActionController::TestCase
  setup do
    @current_wait_time = current_wait_times(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:current_wait_times)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create current_wait_time" do
    assert_difference('CurrentWaitTime.count') do
      post :create, current_wait_time: {  }
    end

    assert_redirected_to current_wait_time_path(assigns(:current_wait_time))
  end

  test "should show current_wait_time" do
    get :show, id: @current_wait_time
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @current_wait_time
    assert_response :success
  end

  test "should update current_wait_time" do
    patch :update, id: @current_wait_time, current_wait_time: {  }
    assert_redirected_to current_wait_time_path(assigns(:current_wait_time))
  end

  test "should destroy current_wait_time" do
    assert_difference('CurrentWaitTime.count', -1) do
      delete :destroy, id: @current_wait_time
    end

    assert_redirected_to current_wait_times_path
  end
end
