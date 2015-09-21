require_relative 'serie'
require_relative 'cleaner'
require_relative 'subgrid'

class Sudoku
  attr_reader :values, :columns, :rows, :subgrids, :invalid_series

  def initialize puzzle_string
    @values = get_data_from_puzzle(puzzle_string)
    @invalid_series = []
    self.set_data
  end

  def get_data_from_puzzle puzzle_string
     cleaner = Cleaner.new(puzzle_string)
     cleaner.process
     cleaner.values
  end

  def set_data
    @columns = @values
    @rows = set_rows
    @subgrids = set_subgrids
    @data = [@columns, @rows, @subgrids]
  end

  def set_rows
    data = []
    (0..8).to_a.each do |index|
      row = []
      @values.each { |value| row << value[index] } 
      data << row
    end
    data
  end

  def set_subgrids
    results = []
    @values.each do |value|
      results << value.each_slice(3).to_a
    end
    Subgrid.new(results).values
  end

  def validate
    @data.each do |data|
      serie = Serie.new(data)
      serie.validate
      add_invalid_serie(data) unless serie.valid?
    end
  end

  def valid?
    @invalid_series.empty?
  end

  def add_invalid_serie data
    @invalid_series << data
  end

  def complete?
    @data.each do |data|
      return false unless Serie.new(data).complete?
    end
    true
  end
end
