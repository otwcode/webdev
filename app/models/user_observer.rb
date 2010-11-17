class UserObserver < ActiveRecord::Observer
  def after_create(user)
    UserMailer.deliver_request("requests@transformativeworks.org", user) 
  end
end
