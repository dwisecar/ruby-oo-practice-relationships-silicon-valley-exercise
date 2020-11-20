require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console



s1 = Startup.new("company1", "Bob", "internet")
s2 = Startup.new("company2", "Rob", "internet also")

v1 = VentureCapitalist.new("Harry Dunn", 2000000000)
v2 = VentureCapitalist.new("Lloyd Christmas", 1000)
v3 = VentureCapitalist.new("Beer Dad", 50000000000)

f1 = FundingRound.new(s1, v1, "Angel", 2000)
f2 = s1.sign_contract(v1, "angel", 23)
f3 = s1.sign_contract(v3, "type 2", 4000)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line