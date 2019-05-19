require 'pry'
class Follower

    attr_reader :name, :age, :life_motto

    @@all = []
    def self.all
        @@all
    end
    
    def initialize(name, age, life_motto)
        @name, @age, @life_motto = name, age, life_motto
        @@all << self
    end

    def bloodoaths
        BloodOath.all.select {|bo| bo.follower == self}
    end

    def cults
        bloodoaths.map {|bo| bo.cult}
    end

    def join_cult(cult, initiation_date)
        if cults.include?(cult)
            "Already in this cult."
        elsif @age < cult.minimum_age
            "Too young to join this cult"
        else
            BloodOath.new(cult, self, initiation_date)
        end
    end

    def my_cults_slogans
        cults.map {|cult| cult.slogan}
    end

    def fellow_cult_members
        fellow_membs = []
        cults.map do|cult| 
            fellow_membs << cult.followers.map {|follower| follower.name}
        end
        fellow_membs.flatten.uniq
    end

        

    def self.top_ten
        tot_follower = Follower.all.count
        max = tot_follower < 10 ? tot_follower : 9
        self.all.sort_by {|follower| follower.cults.count}[0..max].reverse!
    end

    def self.most_active #follower with most cults
        max_cults = self.all.map { |follower| follower.cults.count }.max

        self.all.select {|follower| follower.cults.count == max_cults}
    end

    def self.of_a_certain_age(age)
        self.all.select {|follower| follower.age == age}
    end
    
end