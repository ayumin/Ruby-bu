require (File.dirname(__FILE__) + '/spec_helper') 
require 'game' 
describe Game do 
  before do
    @game = Game.new
  end
  describe "when all roll was gutter" do 
    before do 
      20.times do     # 全部ガターの場合は20回投球することになる
        gutter # rollは倒したピンの数を引数にとる
      end
    end 
    it "score should be 0." do 
      @game.score.should == 0 # スコアは0点であること 
    end 
  end
  describe "when all roll was 1 pin," do 
    before do 
      20.times do     # 全部１本倒した場合は20回投球することになる
        @game.roll(1)
      end
    end 
    it "score should be 20." do 
      @game.score.should == 20 # スコアは20点であること 
    end 
  end 
  describe "when rolls contain a strike," do 
    before do 
      strike # 第１フレーム：ストライク
      @game.roll(3)  # 第２フレーム第１投：３点
      @game.roll(5)  # 第２フレーム第２投：５点
      # => ここで第１、２フレームまでの得点がきまる
      # => 第１フレームは 10 + 3 + 5 = 18
      # => 第２フレームは 18 + 3 + 5 = 26
      @game.roll(7)  # 第３フレーム第１投：７点
      gutter  # 第３フレーム第２投：ガター
      # => 第３フレームは 26 + 7 + 0 = 33
      14.times do
        gutter # 第４フレーム以降は全てガター
      end
    end 
    it "score should be 33." do 
      @game.score.should == 33 # スコアは33点であること 
    end 
  end
  describe "when all roll was strike," do
    before do      # パーフェクトゲームの場合
      12.times do
        strike
      end
    end
    it "score should be 300" do
      @game.score.should == 300 # スコアは300点であること 
    end
  end
  describe "when rolls contain spair," do
    before do
      @game.roll(7); @game.roll(3) # 第1フレームはスペア
      @game.roll(5); @game.roll(2) # 第2フレームはスペアではない
      # => 第１フレームは  7 + 3 + 5 = 15
      # => 第２フレームは 15 + 5 + 2 = 22
      16.times do
        gutter # 第３フレーム以降は全てガター
      end
    end
    it "score should be 22" do
      @game.score.should == 22 # スコアは22点であること 
    end
  end
  def gutter
    @game.roll(0)
  end
  def strike
    @game.roll(10)
  end
end 

