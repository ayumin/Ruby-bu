require (File.dirname(__FILE__) + '/spec_helper') 
require 'game' 
describe Game do 
  before do
    @game = Game.new
  end
  describe "the UAT case" do
    before do
      [1,4,4,5,6,4,5,5,10,0,1,7,3,6,4,10,2,8,6].each do |pins|
        @game.roll(pins)
      end
    end
    it "score should be 133." do
      @game.score.should == 133
    end
  end
end 

