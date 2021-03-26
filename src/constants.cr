module PassKit
  SIGNING_CERT         = read_base64_key(ENV["SIGNING_CERT"]?)
  PRIVATE_KEY          = read_base64_key(ENV["PRIVATE_KEY"]?)
  PRIVATE_KEY_PASSWORD = read_base64_key(ENV["PRIVATE_KEY_PASSWORD"]?)
  WWDR_CERT            = read_base64_key(ENV["WWDR_CERT"]?)

  def read_base64_key(key : String | Nil) : String
    raise ArgumentError.new("Base64-encoded Key is empty") unless key.presence
    String.new(Base64.decode(key))
  end
end
