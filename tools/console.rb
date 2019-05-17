require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

#binding.pry

evil_witches = Cult.new("Evil Witches","NYC","1920","WE THE BEST!")
jersey_cult = Cult.new("Jersey CULT","SLC","1919","We old")
bootcamp = Cult.new("Bootcamp","Jersey","1921","Dying at bootcamp")
bootcamp2 = Cult.new("Bootcamp","SLC","1922","Dying at bootcamp2")
bootcamp3 = Cult.new("Bootcamp","Jersey","1920","Dying at bootcamp3")

jon = Follower.new("jon",18, "I like witches")
sam = Follower.new("sam",29, "I am confused")
ed = Follower.new("ed",21, "My life is great!")
will = Follower.new("will",21,"hello!")


evil_witches.recruit_follower(jon, "2018-10-19")
sam.join_cult(evil_witches,"2019-11-23")
#puts evil_witches.cult_population
jersey_cult.recruit_follower(jon, "2017-11-24")
#puts jon.cults
#bo1 = BloodOath.new(jon, bootcamp2)
#bo2 = BloodOath.new(sam, bootcamp2, "2013/22/1")


puts BloodOath.first_oath.name

#puts bo1.initiation_date
#puts bo2.initiation_date

#puts Follower.of_a_certain_age("18")
#puts jon.join_cult(evil_witches,"2019-11-23")
#puts Cult.find_by_name("Jersey CULT")
#puts Cult.find_by_name("Evil Witches") == c1 #true
#puts Cult.find_by_location("Jersey") #c2 & c3
#puts Cult.find_by_founding_year("1920") #c1 & c3
#puts evil_witches.average_age #
#Cult.least_popular.each do |cult|
#  puts cult.name
#end

#Cult.most_common_location.each do |loc|
#  puts loc
#end

puts "Mwahahaha!" # just in case pry is buggy and exits
