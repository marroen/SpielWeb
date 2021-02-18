
class Feed
  attr_accessor :stream

  def initialize
    self.stream = []
  end

  def add_post(data)
    # handle data, present with format, send to stream
    self.stream << data
  end

end