module UsersHelper

  #Gravatar  这里用到了 gravatar这个鸟网站
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar") #返回一个img标签
  end
end
