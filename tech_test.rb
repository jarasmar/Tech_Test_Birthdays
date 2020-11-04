require 'date'

class User
  attr_reader :name, :date_of_birth

  def initialize(name, date_of_birth)
    @name = name
    @date_of_birth = date_of_birth
  end

  # Returns and Integer representing the user's current age
  def age 
    if Date.today.month > @date_of_birth.month
      return Date.today.year - @date_of_birth.year
    elsif Date.today.month < @date_of_birth.month
      return Date.today.year - @date_of_birth.year - 1
    elsif Date.today.month == @date_of_birth.month
      if Date.today.day >= @date_of_birth.day
        return Date.today.year - @date_of_birth.year
      else
        return Date.today.year - @date_of_birth.year - 1
      end
    end
  end

  # Returns a Date object for the user's next birthday
  def next_birthday
    # code here
  end
end

tests = [
  Date.new(1986, 1, 1),
  Date.new(1988, Date.today.month, Date.today.day),
  Date.new(1992, 12, 30),
  Date.new(1992, 06, 06)
]

puts '===== ages ====='
tests.each do |date|
  puts "#{date} => #{User.new('Test', date).age}"
end

puts '===== birthdays ====='
tests.each do |date|
  puts "#{date} => #{User.new('Test', date).next_birthday}"
end