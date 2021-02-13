# checks if party is open
# prints 'door open animation' if true
# make necessary 'notify_proximate_parties' method

require_relative 'member' # accesses 'member.rb'
require_relative 'venue' # try to 'require_all'

class Party
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

class Searcher
  attr_accessor :parties

  def initialize
    self.parties = []
  end

  def privacy_check(party)
    return 'door open animation' if party.privacy == 'open' # replace with actual animation
  end

  def coord_check(parties)
    
    parties.each do | p |
      parties.each do | next_p |
        next if next_p.object_id == p.object_id
        if next_p.coord[0] == p.coord[0] && next_p.coord[1] == p.coord[1]
          if !next_p.neighbours.include? p
            next_p.neighbours << p
            p.neighbours << next_p
            puts "#{p.object_id} is close to #{next_p.object_id}!"
          end
        end
      end
    end
  end

  def new_id_test
    self.parties.each_with_index do | p, i |
      puts "checking object_id #{p.object_id} of nr. #{i} iteration, first loop."
      self.parties.each_with_index do | next_p, j |
        puts "against object_id #{next_p.object_id} of #{j} iteration, second loop."
        #return 'the object_id worked' if next_p.object_id == p.object_id # -> does match
      end
    end
  end
    
end

puts
# testing party privacy
party = Party.new('me', 'open', [1, 1])
puts 'party privacy: '
puts party.privacy
party.privacy = 'closed'
puts party.privacy

puts
# testing door animation
searcher = Searcher.new
searcher.parties << party
puts 'should door animate?'
puts '1st check: '
#puts searcher.privacy_check(searcher.parties.first) # -> doesn't animate
searcher.parties.first.privacy = 'open'
puts '2nd check: '
puts searcher.privacy_check(searcher.parties.first) # -> should animate

puts
# testing party proximity
searcher.parties << new_party = Party.new('me', 'open', [1, 2])
searcher.coord_check(searcher.parties)
searcher.parties << last_party = Party.new('me', 'open', [1, 1])
searcher.coord_check(searcher.parties) # -> should find neighbour when searching from id=1 to id=3

puts
# checking if host is added, where 'host' is a String but should be of Member-type
puts "The host of #{party.object_id} is #{party.hosts.first}." # -> returns first host

puts
# testing folderclass and adding a new member of Member-type
m = Member.new('Marty', false)
party.members << m
puts "The second member of #{party.object_id} is #{party.members[1].name}."

puts
# rating a party, without checking if its complete
party.rating = 10
puts "#{party.object_id} was rated #{party.rating}."

puts
# setting an age requirement, as well as an age- and member-limit for the party
party.age_req = 18
party.age_limit = 30
party.member_limit = 100
puts "#{party.object_id} has an age req. of #{party.age_req}, "
puts "an age limit of #{party.age_limit} and a mem. limit of #{party.member_limit}."

#puts 
# setting up object_id test method
#puts searcher.new_id_test # -> generates and views unique object IDs

puts
# setting a venue
party.venue = Venue.new('Søndre Samfund')
puts "The venue of party #{party.object_id} is #{party.venue.name}."

puts
# adding current time and time arguments
time = Time.new
party.set_date_start(2021, 2, 12, 18)#, 2)
party.set_date_end(2021, 2, 12, 18, 16)
party.check_if_start
party.check_if_stop
puts "#{party.object_id} is active: #{party.is_active}."
puts "Complete? #{party.is_complete}."