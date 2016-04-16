require 'test_helper'

class BolhasControllerTest < ActionController::TestCase
  setup do
    @bolha = bolhas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bolhas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bolha" do
    assert_difference('Bolha.count') do
      post :create, bolha: { content: @bolha.content, l_name: @bolha.l_name, r_name: @bolha.r_name, title: @bolha.title }
    end

    assert_redirected_to bolha_path(assigns(:bolha))
  end

  test "should show bolha" do
    get :show, id: @bolha
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bolha
    assert_response :success
  end

  test "should update bolha" do
    patch :update, id: @bolha, bolha: { content: @bolha.content, l_name: @bolha.l_name, r_name: @bolha.r_name, title: @bolha.title }
    assert_redirected_to bolha_path(assigns(:bolha))
  end

  test "should destroy bolha" do
    assert_difference('Bolha.count', -1) do
      delete :destroy, id: @bolha
    end

    assert_redirected_to bolhas_path
  end
end
