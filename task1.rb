# frozen_string_literal: true

# Task 1
module Task1
  @max_temp = -99
  @date_max_temp = 0
  @min_temp = 1000
  @date_min_temp = 0
  @max_humi = -999
  @date_max_humi = 0

  def self.calculate_max_temp(requred_arr)
    return unless @max_temp < requred_arr[1].to_i && requred_arr[1] != ''

    @max_temp = requred_arr[1].to_i
    @date_max_temp = requred_arr[0]
  end

  def self.calculate_min_temp(requred_arr)
    return unless @min_temp > requred_arr[3].to_i && requred_arr[3] != ''

    @min_temp = requred_arr[3].to_i
    @date_min_temp = requred_arr[0]
  end

  def self.calculation_task1(file)
    file.readlines.each_with_index do |line, index|
      next if index.zero?

      requred_arr = line.split(',')
      calculate_max_temp(requred_arr)
      calculate_min_temp(requred_arr)

      if @max_humi < requred_arr[7].to_i && requred_arr[7] != ''
        @max_humi = requred_arr[7].to_i
        @date_max_humi = line.split(',')[0]
      end
    end
  end

  def self.read_dirs(all_dirs, cityy)
    if all_dirs.length.zero?
      puts 'No data found'
    else
      all_dirs.each do |i|
        File.open("#{cityy}/#{i}", 'r') do |file|
          calculation_task1(file)
        end
      end
      display_result

    end
  end

  def self.find(cityy, yearr)
    # puts cityy
    all_dirs = Dir.entries(cityy.to_s).select { |item| item.include?(yearr.to_s) }
    read_dirs(all_dirs, cityy)
  end

  def self.display_result
    puts "Highest : #{@max_temp}C , on #{@date_max_temp} "
    puts "Lowest : #{@min_temp}C , on #{@date_min_temp} "
    puts "Humid : #{@max_humi}% , on #{@date_max_humi} "
  end
end
