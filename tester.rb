
require_relative 'marketplace'
require_relative 'member'
require_relative 'party'
require_relative 'searcher'
require_relative 'venue'
require_relative 'feed'

## ***** party.rb test start *****
#puts
## testing party privacy
#party = Party.new('me', 'open', [1, 1])
#puts 'party privacy: '
#puts party.privacy
#party.privacy = 'closed'
#puts party.privacy
#
#puts
## checking if host is added, where 'host' is a String but should be of Member-type
#puts "The host of #{party.object_id} is #{party.hosts.first}." # -> returns first host
#
#puts
## testing folderclass and adding a new member of Member-type
#m = Member.new('Marty', false)
#party.members << m
#puts "The second member of #{party.object_id} is #{party.members[1].name}."
#
#puts
## rating a party, without checking if its complete
#party.rating = 10
#puts "#{party.object_id} was rated #{party.rating}."
#
#puts
## setting an age requirement, as well as an age- and member-limit for the party
#party.age_req = 18
#party.age_limit = 30
#party.member_limit = 100
#puts "#{party.object_id} has an age req. of #{party.age_req}, "
#puts "an age limit of #{party.age_limit} and a mem. limit of #{party.member_limit}."
#
#puts
## setting a venue
#party.venue = Venue.new('Søndre Samfund')
#puts "The venue of party #{party.object_id} is #{party.venue.name}."
#
#puts
## adding current time and time arguments
#time = Time.new
#party.set_date_start(2021, 2, 12, 18)#, 2)
#party.set_date_end(2021, 2, 12, 18, 16)
#party.check_if_start
#party.check_if_stop
#puts "#{party.object_id} is active: #{party.is_active}."
#puts "Complete? #{party.is_complete}."
## ***** party.rb test end *****
## ***** searcher.rb test start *****
#puts
## testing party privacy
#party = Party.new('me', 'open', [1, 1])
#puts 'party privacy: '
#puts party.privacy
#party.privacy = 'closed'
#puts party.privacy
#
#puts
## testing door animation
#searcher = Searcher.new
#searcher.parties << party
#puts 'should door animate?'
#puts '1st check: '
##puts searcher.privacy_check(searcher.parties.first) # -> doesn't animate
#searcher.parties.first.privacy = 'open'
#puts '2nd check: '
#puts searcher.privacy_check(searcher.parties.first) # -> should animate
#
#puts
## testing party proximity
#searcher.parties << new_party = Party.new('me', 'open', [1, 2])
#searcher.coord_check(searcher.parties)
#searcher.parties << last_party = Party.new('me', 'open', [1, 1])
#searcher.coord_check(searcher.parties) # -> should find neighbour when searching from id=1 to id=3
## ***** searcher.rb test end *****
## ***** member.rb test start *****
## testing host permission
#m = Member.new('Martin Rønning', false)
#m.host_party('1') # -> is not able to host
#m.host = true
#m.host_party('1') # -> is able to host
#puts "The name of the first member is #{m.name} and is he a host? #{m.host} is the answer."
#m.host = false
#puts "Is #{m.name} now a host? #{m.host}."
#m.host = true # m is a host
#
#puts
## testing party functions
#puts "current parties of #{m.name}: "
#puts m.parties
#m.host_party('2')
#puts "current parties of #{m.name}: "
#puts m.parties # -> has two parties, party1 & party2
#m.leave_party('party1')
#puts "current parties of #{m.name}: "
#puts m.parties # -> removed undesired party, now only party2 left
## ***** member.rb test end *****
#
## ***** 