class Cleaner
  DASHES = "------+------+------"
  attr_reader :values, :puzzle_string

  def initialize puzzle_string
    @puzzle_string = puzzle_string
    @values = []
    self.values
  end

  def process
    convert_string_to_array
    remove_dashes
    @values.collect! do |data|
      clean_data(data)
    end
  end

  def convert_string_to_array
    @values = @puzzle_string.split("\n")
  end

  def remove_dashes
    @values.delete_if { |data| data == DASHES }
  end

  def clean_data data
     data.gsub!("|", "")
     data = data.split(" ")
     data.map!(&:to_i)
  end
end
