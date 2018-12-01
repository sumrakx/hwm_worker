require 'logger'

##
# Used to log actions by application
#
class WorkLogger
  @current = Logger.new('logs/worker.log', 'weekly')

  class << self
    attr_reader :current
  end
end
