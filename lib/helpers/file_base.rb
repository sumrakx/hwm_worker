##
# Used to write file actions needed by app. Simple file db
#
module FileBase
  extend self

  PATH = Pathname.new('file_base')

  def last_work(user_id)
    return unless File.exist?(last_work_user_path(user_id))

    File.read(last_work_user_path(user_id)).strip
  end

  def write_last_work(user_id)
    File.open(last_work_user_path(user_id), 'w+') do |f|
      f.puts Time.now.to_i
    end
  end

  private

  def last_work_user_path(user_id)
    PATH.join "last-work-#{user_id}.db"
  end
end
