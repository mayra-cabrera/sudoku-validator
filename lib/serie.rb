class Serie
  NUMBERS = (1..9).to_a 
  SIZE = 9
  attr_reader :values

  def initialize values
    @values = values
    @invalid_values = []
    @valid = true
  end

  def validate
    @values.each do |value|
      value.delete_if {|n| n == 0}
      if value.uniq.count != value.count
        @invalid_values << value
        @valid = false
      end
    end
  end

  def valid?
    @valid
  end

  def complete?
    complete = @values.flatten
    NUMBERS.each do |number|
      group = complete.select{|value| value == number }
      return false unless group.count == SIZE
    end
  end
end

