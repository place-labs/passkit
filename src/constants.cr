require "habitat"

module PassKit
  Habitat.create do
    setting signing_cert : String = PassKit.env_base64("SIGNING_CERT")
    setting private_key : String = PassKit.env_base64("PRIVATE_KEY")
    setting wwdr_cert : String = PassKit.env_base64("WWDR_CERT")
    setting private_key_password : String = ENV["PRIVATE_KEY_PASSWORD"]
  end

  protected def self.env_base64(key : String) : String
    raise ArgumentError.new("Base64-encoded ENV #{key} is empty") unless ENV[key]?.presence
    String.new(Base64.decode(ENV[key]))
  end
end
