require 'test_helper'
#测试辅助方法
class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal set_title, '我的博客'
    assert_equal set_title('Help'), 'Help | 我的博客'
  end
end