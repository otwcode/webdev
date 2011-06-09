#!script/rails runner
# usage:
# RAILS_ENV=production script/create_admin.rb

print "Enter admin email: "
email = gets.chomp

print "Enter admin username: "
login = gets.chomp

print "Enter admin password: "
password = gets.chomp

print "Enter admin visible password: "
visible = gets.chomp

a=User.new(:email => email, :login => login, :password => password, :password_confirmation => password, :visible_password => visible)

if a.save
  print "Admin created\n"
  a.update_attribute(:admin, true)
else
  y a.errors.full_messages
end
