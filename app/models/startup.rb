class Startup
    attr_reader :founder
    attr_accessor :name, :domain

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self

    end

    def pivot(name, domain)
        self.name = name
        self.domain = domain
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder_name)
        self.all.select {|startup| startup.founder == founder_name }
    end

    def self.domains
        self.all.map {|startup| startup.domain }
    end

    def sign_contract(venture_capitalist, investment_type, investment_amount)
        FundingRound.new(self, venture_capitalist, investment_type, investment_amount.to_f)
    end

    def all_funding_rounds
        FundingRound.all.select{|funding_round| funding_round.startup == self}
    end

    def num_funding_rounds
        self.all_funding_rounds.count
    end

    def total_funds
        self.all_funding_rounds.sum {|round| round.investment}
    end

    def investors
        self.all_funding_rounds.map {|round| round.venture_capitalist }.uniq
    end

    def big_investors
        self.investors.find_all {|i| VentureCapitalist.tres_commas_club.include?(i)}
    end


end
