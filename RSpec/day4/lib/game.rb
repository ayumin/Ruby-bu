class Game
  FRAME_NUMBER = 10
  def initialize
    @score = []
    @roll_index = 0
  end
  def roll pins
    @score << pins
  end
  def score 
    score = 0 # �����܂ł̃t���[���̓��_
    FRAME_NUMBER.times do
      score += @score[@roll_index] + @score[@roll_index + 1] 
      score += bonus if strike or spair # �X�g���C�N���X�y�A�Ȃ�{�[�i�X
      @roll_index += strike ? 1 : 2     # �X�g���C�N�Ȃ�P������ȊO�Ȃ�Q�������i�߂�
    end
    score
  end
  private
  def strike
    @score[@roll_index] == 10
  end
  def spair
    @score[@roll_index] + @score[@roll_index + 1] == 10 
  end
  def bonus
    @score[@roll_index + 2]
  end
end 
