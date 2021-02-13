class Member
  attr_accessor :name, :parties, :host, :snap, :active_parties
  #attr_reader :name, :host, :snap # might want to immutable it

  def initialize(name, host)
    self.name = name
    self.host = host # boolean
    self.parties = []
    self.snap = 'unknown'
  end

  def host_party(party_nr)
    return if !host # member is host if party.hosts.include? member
    puts 'yay we hostin'
    # party = Party.new and << to self.parties
    # party.host = self

    # ***** temp *****
    parties << "party#{party_nr}"
  end

  def join_party(party) # desired party
    # must send query for permission
    # if successful, << to self.parties
  end

  def leave_party(party) # undesired party
    return if !parties.include? party # should return if not in the undesired party

    # ***** temp *****
    self.parties.delete('party1')
  end

end

# testing host permission
m = Member.new('Martin Rønning', false)
m.host_party('1') # -> is not able to host
m.host = true
m.host_party('1') # -> is able to host
puts "The name of the first member is #{m.name} and is he a host? #{m.host} is the answer."
m.host = false
puts "Is #{m.name} now a host? #{m.host}."
m.host = true # m is a host

puts
# testing party functions
puts "current parties of #{m.name}: "
puts m.parties
m.host_party('2')
puts "current parties of #{m.name}: "
puts m.parties # -> has two parties, party1 & party2
m.leave_party('party1')
puts "current parties of #{m.name}: "
puts m.parties # -> removed undesired party, now only party2 left