require 'yaml'

##
# Fetch user by credentials
#
class User
  @users ||= YAML.load_file('.hwm_credentials.yml')['users']

  class << self
    attr_reader :users

    def all
      users.map do |user|
        new(user)
      end
    end

    def find(login:)
      user = users.find { |hero| hero['login'] == login }

      new(user)
    end
  end

  def initialize(record)
    @record = record
  end

  def login
    @record['login']
  end

  def password
    @record['password']
  end
end
