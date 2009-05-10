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
      if pins == 10         # ストライク
        bonus_count = 2     # ストライクをとると後の２投球分がボーナス
      elsif bonus_count > 0 # ボーナスカウントが残っていたら
        score += pins       # ボーナス分を計上
        bonus_count -= 1    # カウントを１減らす
      end
      score += pins         # 当該投球分の得点を計上
    end
    score
  end 
end 
