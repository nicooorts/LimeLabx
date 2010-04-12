require "rubygems"
require "uuidtools"

module UuidHelper
  def before_create()
    self.pid = UUID.timestamp_create().to_s
  end

end