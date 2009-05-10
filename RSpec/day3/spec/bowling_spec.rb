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
  describe "when strike," do 
    before do 
      @game = Game.new 
      @game.roll(10) # 第１フレーム：ストライク
      @game.roll(3)  # 第２フレーム第１投：３点
      @game.roll(5)  # 第２フレーム第２投：５点
      # => ここで第１、２フレームまでの得点がきまる
      # => 第１フレームは 10 + 3 + 5 = 18
      # => 第２フレームは 18 + 3 + 5 = 26
      @game.roll(7)  # 第３フレーム第１投：７点
      @game.roll(0)  # 第３フレーム第２投：ガター
      # => 第３フレームは 26 + 7 + 0 = 33
      14.times do
        @game.roll(0) # 第４フレーム以降は全てガター
      end
    end 
    it "score should be 33." do 
      @game.score.should == 33 # スコアは33点であること 
    end 
  end 
end 

