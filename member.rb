
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
