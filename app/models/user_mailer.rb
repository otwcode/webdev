class UserMailer < ActionMailer::Base
  def new_request(recipient, user)
    @user = user
    mail(:to => recipient, :subject => "Webdev Request", :from => user.email)
  end
  def update_request(recipient, user)
    @user = user
    mail(:to => recipient, :subject => "Webdev Update Request", :from => user.email)
  end
end
