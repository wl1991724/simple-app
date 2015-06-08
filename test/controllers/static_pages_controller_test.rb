require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "home | 我的博客"
  end

  test "should get help" do
    get :help
    assert_response :success
    assert_select "title", "help | 我的博客"
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "about | 我的博客"
  end
end
