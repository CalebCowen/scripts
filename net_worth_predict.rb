net_worth = 0.0
years = 0

print "What is your annual income? > "
income = gets.chomp.to_f
print "What percentage of your income can you live on? > "
percentage = gets.chomp.to_f
excess = income - (income * (percentage / 100.0))
puts "Excess is $#{excess}"

while net_worth * 0.04 < income * (percentage / 100.0)
  years += 1
  net_worth += excess
  roi = net_worth * 0.12
  net_worth += roi
end

puts "$#{net_worth} in #{years} years"
