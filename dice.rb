require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"
# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  "Hello, world"
end

get("/zebra") do
  "I am a pretty zebra"
end

get ("/giraffe") do
  "Giraffe is cute"
end

get ("/dice") do
  "<h1>Dice Roll</h1>
  <ul>
    <li><a href=\"/dice/2d6\">Roll two 6-sided dice</a></li>
  <li><a href=\"/dice/2d10\">Roll two 10-sided dice</a></li>
  <li><a href=\"/dice/1d20\">Roll one 20-sided die</a></li>
  <li><a href=\"/dice/5d4\">Roll five 4-sided dice</a></li>
  </ul>"
end

get ("/dice/2d6") do
  first_die = rand (1..6)
  second_die = rand (1..6)
  sum = first_die + second_die
  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."

  "<h1>2d6</h1>
  <p>#{outcome}</p>"
end

get ("/dice/2d10") do
  first_die = rand (1..10)
  second_die = rand(1..10)
  sum = first_die + second_die
  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
  
  "<h1>2d10</h1>
  <p>#{outcome}</p>"
end

get ("/dice/1d20") do
  die = rand (1..20)
  outcome = "You rolled a #{die}."
  "<h1>1d20</h1>
  <p>#{outcome}</p>"
end

get ("/dice/5d4") do
  first_die = rand(1..4)
  second_die = rand(1..4)
  third_die = rand(1..4)
  fourth_die = rand(1..4)
  fifth_die = rand(1..4)
  sum = first_die + second_die + third_die + fourth_die + fifth_die
  outcome = "You rolled a #{first_die}, a #{second_die}, a #{third_die}, a #{fourth_die} and a #{fifth_die} for a total of #{sum}."
  "<h1>5d4</h1>
  <p>#{outcome}</p>"
end
