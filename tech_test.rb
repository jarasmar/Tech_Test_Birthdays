require 'date'

class User
  attr_reader :name, :date_of_birth

  def initialize(name, date_of_birth)
    @name = name
    @date_of_birth = date_of_birth
  end

  # Returns and Integer representing the user's current age
  def age 
    @age = Date.today.year - @date_of_birth.year

    # Case birthday month has passed
    return @age if Date.today.month > @date_of_birth.month

    # Case birthday month has not yet passed
    return @age - 1 if Date.today.month < @date_of_birth.month

    # Case birthday month is current month
    if Date.today.month == @date_of_birth.month
      if Date.today.day >= @date_of_birth.day
        return @age
      else
        return @age - 1
      end
    end
  end

  # Returns a Date object for the user's next birthday
  def next_birthday
    @current_year = Date.today.year
    @birth_month = @date_of_birth.month
    @birth_day = @date_of_birth.day

    # Case birthday month has passed
    return Date.new(@current_year + 1, @birth_month, @birth_day) if Date.today.month > @birth_month

    # Case birthday month has not yet passed
    return Date.new(@current_year, @birth_month, @birth_day) if Date.today.month < @birth_month
    
    # Case birthday month is current month
    if Date.today.month == @birth_month
      if Date.today.day >= @birth_day
        return Date.new(@current_year + 1, @birth_month, @birth_day)
      else
        return Date.new(@current_year, @birth_month, @birth_day)
      end
    end
  end
end

tests = [
  Date.new(1986, 1, 1),
  Date.new(1988, Date.today.month, Date.today.day),
  Date.new(1992, 12, 30),
  Date.new(1992, 06, 06),
  Date.new(1992, 11, 05),
  Date.new(1992, 11, 04),
  Date.new(1992, 11, 03)
]

puts '===== ages ====='
tests.each do |date|
  puts "#{date} => #{User.new('Test', date).age}"
end

puts '===== birthdays ====='
tests.each do |date|
  puts "#{date} => #{User.new('Test', date).next_birthday}"
end