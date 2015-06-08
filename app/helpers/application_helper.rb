module ApplicationHelper

  def set_title(title='')
    base_title='我的博客'
    if title.blank?
      base_title
    else
      "#{title} | #{base_title}"
    end
  end
end
