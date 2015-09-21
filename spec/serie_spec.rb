require_relative "../lib/serie"

describe Serie do
  let(:valid_and_complete){ 
    [[8, 5, 9, 6, 1, 2, 4, 3, 7],[7, 2, 3, 8, 5, 4, 1, 6, 9],[1, 6, 4, 3, 7, 9, 5, 2, 8],
    [9, 8, 6, 1, 4, 7, 3, 5, 2],[3, 7, 5, 2, 6, 8, 9, 1, 4],[2, 4, 1, 5, 9, 3, 7, 8, 6],
    [4, 3, 2, 9, 8, 1, 6, 7, 5],[6, 1, 7, 4, 2, 5, 8, 9, 3],[5, 9, 8, 7, 3, 6, 2, 4, 1]] 
  }

  let(:valid_and_incomplete){ 
    [[8, 5, 0, 0, 0, 2, 4, 0, 0],[7, 2, 3, 8, 5, 4, 1, 6, 9],[1, 6, 4, 3, 7, 9, 5, 2, 8],
    [9, 8, 6, 1, 4, 7, 3, 5, 2],[3, 7, 5, 2, 6, 8, 9, 1, 4],[2, 4, 1, 5, 9, 3, 7, 8, 6],
    [4, 3, 2, 9, 8, 1, 6, 7, 5],[6, 1, 7, 4, 2, 5, 8, 9, 3],[5, 9, 8, 7, 3, 6, 2, 4, 1]] 
  } 

  let(:invalid_and_complete){ 
    [[8, 5, 1, 1, 2, 2, 4, 3, 7],[7, 2, 3, 8, 5, 4, 1, 6, 9],[1, 6, 4, 3, 7, 9, 5, 2, 8],
    [9, 8, 6, 1, 4, 7, 3, 5, 2],[3, 7, 5, 2, 6, 8, 9, 1, 4],[2, 4, 1, 5, 9, 3, 7, 8, 6],
    [4, 3, 2, 9, 8, 1, 6, 7, 5],[6, 1, 7, 4, 3, 5, 8, 9, 3],[5, 9, 8, 7, 3, 6, 2, 4, 1]] 
  }

 let(:invalid_and_incomplete){
  [[8, 5, 0, 0, 0, 2, 4, 0, 0],[7, 2, 3, 8, 5, 4, 1, 6, 9],[1, 6, 4, 3, 7, 9, 5, 2, 8],
  [9, 8, 6, 1, 4, 7, 2, 5, 2],[3, 7, 5, 2, 6, 8, 9, 1, 4],[2, 4, 1, 5, 9, 3, 7, 8, 6],
  [4, 3, 2, 9, 8, 1, 6, 7, 5],[6, 2, 7, 4, 2, 5, 8, 9, 3],[5, 9, 8, 7, 3, 6, 2, 4, 1]] 
 } 

  describe "#valid?" do
    context "And has no repeated numbers" do
      it "should return true" do
        serie = Serie.new(valid_and_complete)
        serie.validate
        expect(serie.valid?).to be_truthy
      end
    end

    context "And is incomplete" do
      it "should return true" do
        serie = Serie.new(valid_and_incomplete)
        serie.validate
        expect(serie.valid?).to be_truthy
      end
    end

    context "And repeated numbers" do
      it "should return false" do
        serie = Serie.new(invalid_and_complete)
        serie.validate
        expect(serie.valid?).to be_falsy
      end 
    end
  end

  describe "#complete?" do
    context "When series has no zeros" do      
      it "should return true" do
        serie = Serie.new(valid_and_complete)
        expect(serie.complete?).to be_truthy
      end
    end

    context "When series has zeros" do
      it "should return false" do
        serie =  Serie.new(valid_and_incomplete)
        expect(serie.complete?).to be_falsy
      end
    end
  end
end
