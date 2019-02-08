require 'active_support'
require 'digest'

# msg = ''
# secret = SecureRandom::hex(64)

secret = Digest::SHA512.hexdigest(ENV['HOSTNAME'])
encryptor = ::ActiveSupport::MessageEncryptor.new(secret, cipher: 'aes-256-cbc')

# encryptMsg = encryptor.encrypt_and_sign(msg)
# puts encryptMsg
#
encryptor.decrypt_and_verify(ENV['SALT'])
