require 'pry'
class Cult

    attr_reader :name, :location, :founding_year, :slogan, :minimum_age
    #attr_accessor :followers

    @@all = []
    def self.all
        @@all
    end
    
    def initialize(name, location, founding_year, slogan, minimum_age)
        @name, @location, @founding_year, @slogan, @minimum_age = name, location, founding_year, slogan, minimum_age
        @@all << self
    end

    def bloodoaths
        BloodOath.all.select {|bo| bo.cult == self}
    end

    def followers
        bloodoaths.map {|bo| bo.follower}
    end

    def recruit_follower(follower, initiation_date)
        if followers.include?(follower)
            "Already recruited this follower."
        elsif follower.age < @minimum_age
            "Too young to join this cult."
        else
            BloodOath.new(self, follower, initiation_date)
        end
    end

    def average_age
        followers.inject(0) {|sum, follower| sum + follower.age}/followers.size.to_f
    end

    def my_followers_mottos
        followers.map {|follower| follower.life_motto}
    end

    
    def cult_population
        BloodOath.all.select {|bo| bo.cult == self}.count
    end
    
    def self.least_popular
        min_population = self.all.map { |cult| cult.cult_population }.min
        self.all.select { |cult| cult.cult_population == min_population }
    end

    def self.number_of_cults_at(location)
        self.all.select {|cult| cult.location == location}.count
    end

    def self.all_locations
        self.all.map {|cult| cult.location}.uniq
    end

    def self.most_common_location
        max_cult = Cult.all_locations.map { |location| Cult.number_of_cults_at(location)}.max
        
        self.all.select {|cult| Cult.number_of_cults_at(cult.location) == max_cult}.uniq
    end

    def self.find_by_name(name)
        self.all.find {|cult| cult.name == name}
    end

    def self.find_by_location(location)
        self.all.select {|cult| cult.location == location}
    end

    def self.find_by_founding_year(founding_year)
        self.all.select {|cult| cult.founding_year == founding_year} 
    end
end