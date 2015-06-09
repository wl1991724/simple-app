class User < ActiveRecord::Base

  attr_accessor :remember_token
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
  validates :password, length: {minimum: 6, too_short: '密码太短！'}

  def remember
    self.remember_token=User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  #忘记用户
  def forget
    update_attribute(:remember_digest, nil)
  end

  #自定义方法，匹配的返回 true
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  #返回一个随机令牌
  def self.new_token
    SecureRandom.urlsafe_base64
  end

  #返回指定字符的hash摘要
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
