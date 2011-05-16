class User < ActiveRecord::Base
  attr_protected :admin, :crypted_password, :password_salt
  attr_accessor :password

  validates_confirmation_of :password  
  validates_presence_of :email  
  validates_uniqueness_of :email  

  validates_presence_of :login
  validates_format_of :login,
    :with => Regexp.new(/^[a-z0-9]{3,16}$/), 
    :message => "must be 3-16 characters: lower case alphanumeric only."
  validates_format_of :visible_password,
    :with => Regexp.new(/^[a-zA-Z0-9]{3,16}$/), 
    :message => "must be 3-16 characters: alphanumeric only."

  before_create :create_session
  def create_session
    if self.session_secret.blank?
      alphanumerics = [('0'..'9'),('A'..'Z'),('a'..'z')].map {|range| range.to_a}.flatten
      self.session_secret = (0...100).map { alphanumerics[Kernel.rand(alphanumerics.size)] }.join
    end
    if self.google_code_login.blank?
      self.google_code_login = "not given"
    end
  end

  before_save :encrypt_password
  def encrypt_password
    self.password = ActiveSupport::SecureRandom.hex(10) unless password.present?  
    self.password_salt = BCrypt::Engine.generate_salt  
    self.crypted_password = BCrypt::Engine.hash_secret(password, password_salt)  
  end

  def self.authenticate(login, password)
    user = User.find_by_login(login)
    if user && user.crypted_password == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    end
  end
end
