# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_LimeLabx_session',
  :secret      => '6b30c13cec637da14fa4ca38a777bb3f5ba8b68e873daf8f69a0070b200a151f877b4163e644a41c7166a7482095ff262e127061a7b1ca3dd5d472df41e8b09b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
