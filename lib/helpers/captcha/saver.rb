module Captcha
  ##
  # Save resolved captcha to db
  #
  module Saver
    extend self
    
    def call
      WorkLogger.current.debug { 'Implement me' }
    end
  end
end
