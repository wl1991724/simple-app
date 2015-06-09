class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i #抄来的邮箱regex，这个是常量

  before_save { self.email=email.downcase } #保存前把邮箱统一换成小写 {self.email=self.email.downcase} or {email.downcase!}

  validates :name, presence: {message: '名字不能为空！'},
            length: {maximum: 50, too_long: '名字太长！'}
  #一般情况下，邮箱不区分大小写，要考虑这种情况
  validates :email, presence: {message: '邮箱不能为空！'},
            length: {maximum: 255, too_long: '邮箱太长！'},
            format: {with: VALID_EMAIL_REGEX, message: '请输入正确邮箱'},
            uniqueness: {message: '邮箱已经存在！', case_sensitive: false} #不区分大小写
  has_secure_password #对应的模型里要有password-digest属性
  validates :password,length: {minimum: 6,too_short: '密码太短！'}
end
