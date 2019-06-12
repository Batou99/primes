require_relative 'lib/primelib'
require_relative 'lib/table'

puts "How many primes do you want?"
num = gets.chomp.to_i

Table.new(Primelib.first_primes(num)).print
