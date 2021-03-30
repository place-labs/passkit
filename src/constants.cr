module PassKit
  SIGNING_CERT         = env_base64("SIGNING_CERT")
  PRIVATE_KEY          = env_base64("PRIVATE_KEY")
  WWDR_CERT            = env_base64("WWDR_CERT")
  PRIVATE_KEY_PASSWORD = ENV["PRIVATE_KEY_PASSWORD"]

  private def self.env_base64(key : String) : String
    raise ArgumentError.new("Base64-encoded ENV #{key} is empty") unless ENV[key].presence
    String.new(Base64.decode(ENV[key]))
  end
end
