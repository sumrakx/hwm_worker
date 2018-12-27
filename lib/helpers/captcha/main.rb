require 'helpers/captcha/resolver'
require 'helpers/captcha/saver'
require 'helpers/captcha/encoder'
require 'helpers/captcha/downloader'

module Captcha
  ##
  # All stuff going to captcha goes here
  #    Pass image_url from src <image src='http://heroeswm.ru/work_codes/xxx.png'>
  #    Retrieve string with solved captcha
  #
  module Main
    extend self

    ##
    # TODO: captcha.png getting messed between diff users, so we need to differentiate it
    # pass user here and save it as captcha-#{username}.png
    # and then fetch it without mess
    def call(image_url:)
      Downloader.call(image_url: image_url)
      encoder = Encoder.call
      resolved = Resolver.call(base64_captcha: encoder.base64_captcha)
      Saver.call

      resolved
    end
  end
end
