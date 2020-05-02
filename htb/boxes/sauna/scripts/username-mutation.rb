#!/usr/bin/env ruby
#

full_name = ARGV[0]
first, last = full_name.strip.downcase.split(' ')


puts "#{first}#{last}"
puts "#{first[0,1]}#{last}"
puts "#{first[0,2]}#{last[0,2]}"
puts "#{last}#{first}"
puts "#{last[0,2]}#{first[0,2]}"
puts "#{last[0,1]}#{first}"

separetors = %W{. - _}

separetors.each do |separetor|
  puts "#{first}#{separetor}#{last}"
  puts "#{first[0,2]}#{separetor}#{last[0,2]}"
  puts "#{first[0,1]}#{separetor}#{last}"
  puts "#{last}#{separetor}#{first}"
  puts "#{last[0,2]}#{separetor}#{first[0,2]}"
  puts "#{last[0,1]}#{separetor}#{first}"
end


