class Venue
  attr_accessor :name, :parties, :active_parties, :hosts, :music

  def initialize(name)
    self.name = name
    self.parties = [] # (party.rb)if party.venue.id == (venue.rb)self.id, (venue.rb)self.parties << (party.rb)party
    self.hosts = [] # parties.each do | party | party.members.each do | member | if party.hosts.include? member self.hosts << member
  end

  def play_music
    # think this through
  end

end

v = Venue.new('Søndre Samfund')
puts "The name of the venue is #{v.name} and its ID is #{v.object_id}."