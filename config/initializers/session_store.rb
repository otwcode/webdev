# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_webdev_session',
  :secret      => '6bb5901889c20c5f8584cc2ad0ec9ea380ca6b36485774613c0bf9cef96472aae3f272484b1fd4c4e72419773e3495c85728d314f647cc5c29281a77c982767c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
