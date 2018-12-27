require 'helpers/captcha/request'

module Captcha
  ##
  # Resolve captcha by sending it to rucaptcha
  #
  class Resolver
    attr_reader :solved_text, :base64_captcha

    def self.call(base64_captcha:)
      new(base64_captcha).call
    end

    def call
      request = Request.new(base64_captcha: base64_captcha)
      request.solve
      sleep 20
      request.fetch.json_response['request']
    rescue Captcha::Request::CaptchaNotResolved
      puts 'Captcha::Request::CaptchaNotResolved. Retrying'
      sleep 30
      request.fetch.json_response['request']
    end

    private

    def initialize(base64_captcha)
      @base64_captcha = base64_captcha
      @solved_text = ''
    end
  end
end
