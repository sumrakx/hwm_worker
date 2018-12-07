require 'hwm_worker/login'
require 'hwm_worker/work'
require 'models/user'

class Runer
  def self.call(user:)
    new(user).call
  end

  def call
    WorkLogger.current.info { "Try to login with #{user.login}" }
    Login.call(session: session, user: user)

    WorkLogger.current.info { "Try to apply for a job with #{user.login}" }
    Work.call(session: session, user: user)
  end

  private

  attr_reader :session, :user

  def initialize(user)
    @session = Capybara::Session.new(:selenium_chrome_headless)
    @user = user
  end
end
