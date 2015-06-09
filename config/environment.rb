# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!
#这里可以修改 @@field_error_proc
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance_tag|
  "<div class=\"has-error\">#{html_tag}</div>".html_safe
end
