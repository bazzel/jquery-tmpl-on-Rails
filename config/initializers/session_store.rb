# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_jquery-tmpl_session',
  :secret      => '825eb22820a8ff5317b640bfb3d3ed2798403a9ccb180ce5eaf489a2cb0e475949eb1a27920d7294a2652c31589369b18ef673886328093bb0b370899e5616d0'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
