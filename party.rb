
require_relative 'feed'

class Party < Feed
  attr_accessor :venue, :hosts, :members, :privacy, :coord, :neighbours, :is_active, :is_complete, :rating, :age_req, :age_limit, :member_limit, :date_start, :date_end

  def initialize(host, privacy, coord)
    self.hosts = [host]
    self.members = [host] # adding host as first member
    self.privacy = privacy
    self.coord = coord
    self.neighbours = []
    self.is_active = false
    self.is_complete = false
  end

  def set_date_start(year, month, day, hour)#, minute)
    self.date_start = [year, month, day, hour]#, minute]
  end

  def set_date_end(year, month, day, hour, minute)
    self.date_end = [year, month, day, hour, minute]
  end

  def check_if_start
    time = Time.new
    # initial bruteforce, implies that the method is called each minute if is_active = false
    if self.date_start[0] == time.year
      if self.date_start[1] == time.month
        if self.date_start[2] == time.day
          if self.date_start[3] == time.hour
            self.is_active = true
            #if self.date_start[4] == time.min
            #  self.is_active = true
            #end
          end
        end
      end
    end
  end

  def check_if_stop
    time = Time.new
    # initial bruteforce, implies that the method is called each minute if is_active = true
    if time.year > self.date_end[0] # need to find intuitive function
      self.is_active = false
      self.is_complete = true # can add party to list of completed parties, and look for rating
      return
    elsif time.month > self.date_end[1]
      self.is_active = false
      self.is_complete = true
      return
    elsif time.day > self.date_end[2]
      self.is_active = false
      self.is_complete = true
      return
    elsif time.hour > self.date_end[3]
      self.is_active = false
      self.is_complete = true
      return
    elsif time.min >= self.date_end[4]
      self.is_active = false
      self.is_complete = true
      return
    end
    return
  end

end