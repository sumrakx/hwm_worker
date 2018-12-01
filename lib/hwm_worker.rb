require 'config/initializers'
require 'hwm_worker/version'
require 'hwm_worker/runer'
require 'capybara/session'


require 'byebug'

module HwmWorker
  def self.run
    User.all.each do |user|
      sleep 2
      Thread.new { Runer.call(user: user) }
    end
  end
end
