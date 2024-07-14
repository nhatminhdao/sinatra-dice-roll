require "sinatra"
require "sinatra/reloader"
# <li><a href="/dice/2d6">Roll two 6-sided dice</a></li>

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
  <li>Roll two 6-sided dice</li>
  <li>Roll two 10-sided dice</li>
  <li>Roll one 20-sided die</li>
  <li>Roll five 4-sided dice</li>
  </ul>"
end

get ("/dice/2d6") do
  first_dice = rand (1..6)
  second_dice = rand (1..6)
  sum = first_dice + second_dice
  outcome = "You rolled a #{first_dice} and a #{second_dice} for a total of #{sum}."

  "<h1>2d6</h1>
  <p>#{outcome}</p>"
end
