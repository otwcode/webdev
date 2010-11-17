class UserMailer < ActionMailer::Base
  def request(recipient, user)
    subject       "Webdev Request"
    recipients    recipient
    from          user.email
    sent_on       Time.now
    content_type  "text/plain"
    body          :user => user
  end
  def update(recipient, user)
    subject       "Webdev UPDATE Request"
    recipients    recipient
    from          user.email
    sent_on       Time.now
    content_type  "text/plain"
    body          :user => user
  end
end
