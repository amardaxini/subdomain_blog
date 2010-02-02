# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ryanblog_session',
  :secret      => 'bddc3826308602af3fa7ff1ab7dd58e914753a6372fa4338e0a35f1a55a722a825a5384262058b39958db5da34426de1e619f6d49e99014d201280e75f0aa3c2'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
