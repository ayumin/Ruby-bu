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
    score = 0 # ここまでのフレームの得点
    FRAME_NUMBER.times do
      score += @score[@roll_index] + @score[@roll_index + 1] 
      score += bonus if strike or spair # ストライクかスペアならボーナス
      @roll_index += strike ? 1 : 2     # ストライクなら１投それ以外なら２投分基準を進める
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
