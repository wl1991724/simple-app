require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "invalid signup information" do
    get new_user_path
    assert_no_difference 'User.count' do
      post users_path, user: {name: '', email: 'email@invalid.com',
                              password: 'foo', password_confirmation: 'bar'}
    end
    assert_template 'users/new'
    #测试错误消息
    assert_select 'div#<CSS id for error explanation>'
    assert_select 'div.<CSS class for field with error>'
  end

  test "valid signup information" do
    get new_user_path
    name = "Example User"
    email = "user@example.com"
    password = "password"
    assert_difference 'User.count', 1 do #变化量为1
      post_via_redirect users_path, user: {name: name, email: email,
                                           password: password, password_confirmation: password}
    end
    assert_template 'users/show'
    assert is_logged_in? #测试注册完登陆
    #测试闪现消息
    assert_not flash.nil?
  end

end
