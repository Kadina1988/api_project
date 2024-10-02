class UserAuthenticator 
  class AuthenticationError < StandardError;end
  
  def initialize(code)
    @code = code
  end

  def perform
    raise AuthenticationError
  end
end