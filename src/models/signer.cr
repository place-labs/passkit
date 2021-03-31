require "file"
require "openssl"
require "../constants"
require "../error"

class PassKit::Signer
  @signing_cert : String
  @private_key : String
  @private_key_password : String | Nil
  @wwdr_cert : String

  def initialize(@signing_cert, @private_key, @private_key_password, @wwdr_cert)
  end

  def self.from_env
    new(
      PassKit.settings.signing_cert,
      PassKit.settings.private_key,
      PassKit.settings.wwdr_cert,
      PassKit.settings.private_key_password
    )
  end

  def sign(data) : String
    data_file = File.tempfile { |file| file.print(data) }
    signed_data = `openssl smime -binary -sign -certfile #{@wwdr_cert} -signer #{@signing_cert} -inkey #{@private_key} -in #{data_file.path} -outform DER -passin pass:#{@private_key_password}`
    data_file.delete
    signed_data
  end
end
