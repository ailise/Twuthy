require 'test_helper'

class VoteableModelsControllerTest < ActionController::TestCase
  setup do
    @voteable_model = voteable_models(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:voteable_models)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create voteable_model" do
    assert_difference('VoteableModel.count') do
      post :create, :voteable_model => @voteable_model.attributes
    end

    assert_redirected_to voteable_model_path(assigns(:voteable_model))
  end

  test "should show voteable_model" do
    get :show, :id => @voteable_model.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @voteable_model.to_param
    assert_response :success
  end

  test "should update voteable_model" do
    put :update, :id => @voteable_model.to_param, :voteable_model => @voteable_model.attributes
    assert_redirected_to voteable_model_path(assigns(:voteable_model))
  end

  test "should destroy voteable_model" do
    assert_difference('VoteableModel.count', -1) do
      delete :destroy, :id => @voteable_model.to_param
    end

    assert_redirected_to voteable_models_path
  end
end
