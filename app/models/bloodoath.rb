require 'date'

class BloodOath
    attr_reader :cult, :follower

    @@all = []
    def self.all
        @@all
    end
    
    def initialize(cult, follower, initiation_date=Time.now.strftime("%Y-%m-%d"))
        begin 
            @initiation_date = Date.parse(initiation_date)
        rescue ArgumentError
            puts "Invalid date. Please enter a valid date."
        end
        @cult, @follower = cult, follower
        @@all << self
    end

    def initiation_date
        @initiation_date.strftime("%Y-%m-%d")
    end
    
    def self.first_oath
        #iterate through the followers
        self.all.sort_by{|bo| bo.initiation_date}.first.follower
    end

        #check the date

        #compare dates

        #display the follower
end