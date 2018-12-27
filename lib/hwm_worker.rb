require 'config/initializers'
require 'hwm_worker/version'
require 'hwm_worker/runer'
require 'capybara/session'

module HwmWorker
  def self.run
    # TODO: hack should be used in a single app not in a copies
    Runer.call(user: User.first)
  rescue StandardError => e
    Rollbar.error(e)
  end
end
