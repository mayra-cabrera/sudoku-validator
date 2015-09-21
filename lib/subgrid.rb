class Subgrid
  GRIDS = [0, 1, 2]
  X1 = [0, 1, 2]
  X2 = [3, 4, 5]
  X3 = [6, 7, 8]
  POSITIONS = [X1, X2, X3]
  attr_reader :values

  def initialize data
    self.values = data
  end

  def values=(data)
    @values = []
    GRIDS.each do |grid|
      POSITIONS.each do |position|
        subgrid = []
        position.each{ |p| subgrid << data[p][grid] } 
        @values << subgrid.flatten
      end
    end
  end
end
