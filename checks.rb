module Checks
  def not_empty(message: 'Please enter a valid value')
    print message
    value = gets.chomp
    loop do
      break if value.length.positive?

      print message
      value = gets.chomp
    end
    value
  end

  def numeric(message: 'Please enter a valid value', error: "Please enter a valid number:\s")
    print message
    value = gets.chomp.to_i
    loop do
      break if value.positive?

      print error
      value = gets.chomp.to_i
    end
    value
  end

  def date(message: 'Please enter a valid value', error: "Please enter a date in the format YYYY/MM/DD:\s")
    print message
    value = gets.chomp
    loop do
      return value if value.match(%r{([0-9]){4}/([0-1])([0-9])/([0-3])([0-9])})

      print error
      value = gets.chomp
    end
    value
  end
end
