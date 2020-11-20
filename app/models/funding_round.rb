class FundingRound
    attr_reader :startup, :venture_capitalist
    attr_accessor :type
    attr_writer :investment

    @@all = []

    def initialize(startup, venture_capitalist, type, investment)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type
        @investment = investment
        @@all << self
    end

    def self.all
        @@all
    end

    def investment
        @investment.to_f
    end
end
