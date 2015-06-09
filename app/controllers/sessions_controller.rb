#这个session只代表会话，不是那个session（放数据的） 蛋疼
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user) #记住我
      redirect_to user #user_path(user)
    else
      # flash[:danger]='用户不存在或者密码错误'
      flash.now[:danger]='用户不存在或者密码错误'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in? #登录了才执行退出
    redirect_to root_path
  end
end
