class VentureCapitalist
    attr_reader :name
    attr_accessor :total_worth
    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        self.all.select {|venture_capitalist| venture_capitalist.total_worth > 1000000000}
    end 

    def offer_contract(startup, type, amount)
        FundingRound.new(startup, self, type, amount)
    end

    def funding_rounds
        FundingRound.all.select {|round| round.venture_capitalist == self }
    end

    def portfolio
        self.funding_rounds.map {|round| round.startup }.uniq
    end

    def biggest_investment
        self.funding_rounds.map {|round| round.investment}.max
    end

    def invested(domain)
        self.funding_rounds.select {|round| round.startup.domain == domain }.map {|i|i.investment}.sum
    end


end
