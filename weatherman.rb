# frozen_string_literal: true

require './task1'
require 'byebug'
# creating Runner class
class WeatherMan

  task = ARGV.first
  year = ARGV[1]
  city = ARGV[2]
  if task == '-e' && city && year
    puts 'yaha aya'
    Task1.find(city, year)
  else
    puts 'Invalid Paramter'
  end
end
