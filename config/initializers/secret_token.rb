# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Payment::Application.config.secret_key_base = '745c213d11a11136e9af2175750d746d421a6ef397dc0ce152605b2da75885d3a79d1ca73734dcead275a53a445d753fb62e772c7e0bb916eb3ce3a430db15c2'
