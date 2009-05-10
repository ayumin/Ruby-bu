require (File.dirname(__FILE__) + '/spec_helper') 
require 'game' 
describe Game do 
  describe "when all roll was gutter" do 
    before do 
      @game = Game.new 
      20.times do     # �S���K�^�[�̏ꍇ��20�񓊋����邱�ƂɂȂ�
        @game.roll(0) # roll�͓|�����s���̐��������ɂƂ�
      end
    end 
    it "score should be 0." do 
      @game.score.should == 0 # �X�R�A��0�_�ł��邱�� 
    end 
  end
  describe "when all roll was 1 pin," do 
    before do 
      @game = Game.new 
      20.times do     # �S���P�{�|�����ꍇ��20�񓊋����邱�ƂɂȂ�
        @game.roll(1)
      end
    end 
    it "score should be 20." do 
      @game.score.should == 20 # �X�R�A��20�_�ł��邱�� 
    end 
  end 
end 
