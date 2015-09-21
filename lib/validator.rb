require_relative 'sudoku'

class Validator
  def initialize(puzzle_string)
    @puzzle_string = puzzle_string
    @result = ""
  end

  def self.validate(puzzle_string)
    new(puzzle_string).validate
  end

  def validate
    puzzle = Sudoku.new(@puzzle_string)
    puzzle.validate
    if puzzle.valid?
      if puzzle.complete?
        "This sudoku is valid."
      else
        "This sudoku is valid, but incomplete."
      end
    else
      "This sudoku is invalid."
    end
  end
end
file = File.read(ARGV[0])
p Validator.validate file 
