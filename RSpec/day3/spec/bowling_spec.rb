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
  describe "when strike," do 
    before do 
      @game = Game.new 
      @game.roll(10) # ��P�t���[���F�X�g���C�N
      @game.roll(3)  # ��Q�t���[����P���F�R�_
      @game.roll(5)  # ��Q�t���[����Q���F�T�_
      # => �����ő�P�A�Q�t���[���܂ł̓��_�����܂�
      # => ��P�t���[���� 10 + 3 + 5 = 18
      # => ��Q�t���[���� 18 + 3 + 5 = 26
      @game.roll(7)  # ��R�t���[����P���F�V�_
      @game.roll(0)  # ��R�t���[����Q���F�K�^�[
      # => ��R�t���[���� 26 + 7 + 0 = 33
      14.times do
        @game.roll(0) # ��S�t���[���ȍ~�͑S�ăK�^�[
      end
    end 
    it "score should be 33." do 
      @game.score.should == 33 # �X�R�A��33�_�ł��邱�� 
    end 
  end 
end 

