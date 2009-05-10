require (File.dirname(__FILE__) + '/spec_helper') 
require 'game' 
describe Game do 
  before do
    @game = Game.new
  end
  describe "when all roll was gutter" do 
    before do 
      20.times do     # �S���K�^�[�̏ꍇ��20�񓊋����邱�ƂɂȂ�
        gutter # roll�͓|�����s���̐��������ɂƂ�
      end
    end 
    it "score should be 0." do 
      @game.score.should == 0 # �X�R�A��0�_�ł��邱�� 
    end 
  end
  describe "when all roll was 1 pin," do 
    before do 
      20.times do     # �S���P�{�|�����ꍇ��20�񓊋����邱�ƂɂȂ�
        @game.roll(1)
      end
    end 
    it "score should be 20." do 
      @game.score.should == 20 # �X�R�A��20�_�ł��邱�� 
    end 
  end 
  describe "when rolls contain a strike," do 
    before do 
      strike # ��P�t���[���F�X�g���C�N
      @game.roll(3)  # ��Q�t���[����P���F�R�_
      @game.roll(5)  # ��Q�t���[����Q���F�T�_
      # => �����ő�P�A�Q�t���[���܂ł̓��_�����܂�
      # => ��P�t���[���� 10 + 3 + 5 = 18
      # => ��Q�t���[���� 18 + 3 + 5 = 26
      @game.roll(7)  # ��R�t���[����P���F�V�_
      gutter  # ��R�t���[����Q���F�K�^�[
      # => ��R�t���[���� 26 + 7 + 0 = 33
      14.times do
        gutter # ��S�t���[���ȍ~�͑S�ăK�^�[
      end
    end 
    it "score should be 33." do 
      @game.score.should == 33 # �X�R�A��33�_�ł��邱�� 
    end 
  end
  describe "when all roll was strike," do
    before do      # �p�[�t�F�N�g�Q�[���̏ꍇ
      12.times do
        strike
      end
    end
    it "score should be 300" do
      @game.score.should == 300 # �X�R�A��300�_�ł��邱�� 
    end
  end
  describe "when rolls contain spair," do
    before do
      @game.roll(7); @game.roll(3) # ��1�t���[���̓X�y�A
      @game.roll(5); @game.roll(2) # ��2�t���[���̓X�y�A�ł͂Ȃ�
      # => ��P�t���[����  7 + 3 + 5 = 15
      # => ��Q�t���[���� 15 + 5 + 2 = 22
      16.times do
        gutter # ��R�t���[���ȍ~�͑S�ăK�^�[
      end
    end
    it "score should be 22" do
      @game.score.should == 22 # �X�R�A��22�_�ł��邱�� 
    end
  end
  def gutter
    @game.roll(0)
  end
  def strike
    @game.roll(10)
  end
end 

