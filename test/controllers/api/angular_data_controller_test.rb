require 'test_helper'

class Api::AngularDataControllerTest < ActionController::TestCase
  setup do
    @rails_object = rails_objects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rails_objects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rails_object" do
    assert_difference('RailsObject.count') do
      post :create, rails_object: {  }
    end

    assert_redirected_to rails_object_path(assigns(:rails_object))
  end

  test "should show rails_object" do
    get :show, id: @rails_object
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rails_object
    assert_response :success
  end

  test "should update rails_object" do
    patch :update, id: @rails_object, rails_object: {  }
    assert_redirected_to rails_object_path(assigns(:rails_object))
  end

  test "should destroy rails_object" do
    assert_difference('RailsObject.count', -1) do
      delete :destroy, id: @rails_object
    end

    assert_redirected_to rails_objects_path
  end
end
