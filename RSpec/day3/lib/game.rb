class Game
  def initialize
    @score = []
  end
  def roll pins
    @score << pins
  end
  def score 
    bonus_count = 0
    score = 0
    @score.each do |pins|
      if pins == 10         # �X�g���C�N
        bonus_count = 2     # �X�g���C�N���Ƃ�ƌ�̂Q���������{�[�i�X
      elsif bonus_count > 0 # �{�[�i�X�J�E���g���c���Ă�����
        score += pins       # �{�[�i�X�����v��
        bonus_count -= 1    # �J�E���g���P���炷
      end
      score += pins         # ���Y�������̓��_���v��
    end
    score
  end 
end 
