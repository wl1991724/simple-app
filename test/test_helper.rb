ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
# ENV['RAILS_ENV'] ||= 'test'
# require File.expand_path('../../config/environment', __FILE__)
# require 'rails/test_help'
# require "minitest/reporters"
# Minitest::Reporters.use!   以上是配置在命令行显示红绿的
class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  include ApplicationHelper #引入帮助方法
  # Add more helper methods to be used by all tests here...
  #如果登陆 返回true
  def is_logged_in?
    !session[:user_id].nil?
  end

  #登入测试用户
  def log_in_as(user, options = {})
    password = options[:password] || 'password'
    remember_me = options[:remember_me] || '1'
    if integration_test?
      post login_path, session: {email: user.email,
                                 password: password, remember_me: remember_me}
    else
      session[:user_id] = user.id
    end
  end

  #在集成测试中返回true
  def integration_test?
    defined?(post_via_redirect)
  end
end
