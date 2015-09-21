require_relative "../lib/cleaner"

describe Cleaner do
  let(:puzzle_string){ "8 5 9 |6 1 2 |4 3 7\n7 2 3 |8 5 4 |1 6 9\n1 6 4 |3 7 9 |5 2 8\n------+------+------\n9 8 6 |1 4 7 |3 5 2\n3 7 5 |2 6 8 |9 1 4\n2 4 1 |5 9 3 |7 8 6\n------+------+------\n4 3 2 |9 8 1 |6 7 5\n6 1 7 |4 2 5 |8 9 3\n5 9 8 |7 3 6 |2 4 1\n" }

  describe "#convert_string_to_array" do
    before(:each) do
      @cleaner = Cleaner.new(puzzle_string)
      @cleaner.convert_string_to_array
    end

    it "should return an array" do
      expect(@cleaner.values).to be_a Array
    end

    it "should return an array of 11" do
     expect(@cleaner.values.length).to eq(11)
    end  
  end

  describe "remove_dashes" do
    before(:each) do
      @cleaner = Cleaner.new(puzzle_string)
      @cleaner.convert_string_to_array
      @cleaner.remove_dashes
    end

    it "should remove dashes from array" do
      @cleaner.values.each do |value|
        expect(value).to_not eq(Cleaner::DASHES)
      end
    end 

    it "should decrease array size" do
      expect(@cleaner.values.length).to eq(9)
    end
  end

  describe "clean_data" do
    before(:each) do
      @cleaner = Cleaner.new(puzzle_string)
      @values = @cleaner.clean_data("8 5 9 |6 1 2 |4 3 7")
    end

    it "should remove pipes" do
      expect(@values.include?("|")).to be_falsy
    end  

    it "should convert every slice to an array of integers" do
      @values.each do |value|
       expect(value).to be_a Integer
      end
    end   
  end
  
end
