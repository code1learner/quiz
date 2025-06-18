
require "timeout"
puts "You have 30 seconds to answer as questions."
puts "Press enter when you are ready"
enter = gets


require "CSV"
score = 0
false_guess = 0

begin
  Timeout.timeout(30) do
CSV.foreach("problems.csv") do |inquiry|
  question = inquiry[0] 
  answer = inquiry[1]
  puts "what is #{question}?"
  guess = gets.chomp()

if guess == answer
  score += 1
else
  false_guess += 1
end

end
 
puts "Task completed successfully within the timeout."
end
rescue Timeout::Error
puts "It took longer than expected."

puts "you got #{score} questions right"  

puts "you got #{false_guess} number of  questions wrong"

exit 
end