class User < ActiveRecord::Base
  acts_as_authentic

  attr_protected :admin

  validates_presence_of :google_code_login
  validates_format_of :login,
    :with => Regexp.new(/^[a-zA-Z0-9]{3,16}$/), 
    :message => "must be 3-16 characters: alphanumeric only."
  validates_format_of :visible_password,
    :with => Regexp.new(/^[a-zA-Z0-9]{3,16}$/), 
    :message => "must be 3-16 characters: alphanumeric only."

  def before_create
    if self.session_secret.blank?
      alphanumerics = [('0'..'9'),('A'..'Z'),('a'..'z')].map {|range| range.to_a}.flatten
      self.session_secret = (0...100).map { alphanumerics[Kernel.rand(alphanumerics.size)] }.join
    end
  end

end
