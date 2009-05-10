require (File.dirname(__FILE__) + '/spec_helper') 
require 'game' 
describe Game do 
  describe "when all roll was gutter" do 
    before do 
      @game = Game.new 
      20.times do     # 全部ガターの場合は20回投球することになる
        @game.roll(0) # rollは倒したピンの数を引数にとる
      end
    end 
    it "score should be 0." do 
      @game.score.should == 0 # スコアは0点であること 
    end 
  end
  describe "when all roll was 1 pin," do 
    before do 
      @game = Game.new 
      20.times do     # 全部１本倒した場合は20回投球することになる
        @game.roll(1)
      end
    end 
    it "score should be 20." do 
      @game.score.should == 20 # スコアは20点であること 
    end 
  end 
end 
