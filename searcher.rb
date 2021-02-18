
# checks if party is open
# prints 'door open animation' if true
# make necessary 'find_proximate_parties' method

class Searcher
  attr_accessor :parties

  def initialize
    self.parties = []
  end

  # potentially do a 'party_check' to see if privacy is 'open' and if 'is_active' == true

  def privacy_check(party) # searches for doors to open, perhaps need list of parties as arg.
    return 'door open animation' if party.privacy == 'open' # replace with actual animation
  end


  def coord_check(parties) # checks if parties in a list are close to each other based on sample coord. data
    
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
      
end
