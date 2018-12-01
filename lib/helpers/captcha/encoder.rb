require 'base64'

module Captcha
  ##
  # Encode captcha in order to send to rucaptcha
  #
  class Encoder

    attr_reader :base64_captcha

    def self.call
      new.call
    end

    def call
      encode_captcha
      self
    end

    private

    def encode_captcha
      @base64_captcha = Base64.encode64(File.open('captcha.png', 'rb').read)
    end
  end
end
