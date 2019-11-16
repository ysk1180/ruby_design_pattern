class MuscleTraning
  def execute
    stretch
    main_training
    protein
  end

  def stretch
    puts '全身のストレッチ'
  end

  def main_training
    raise '抽象メソッド(main_training)が呼び出されてるよ'
  end

  def protein
    puts 'プロテイン摂取'
  end
end

class ChestTraining < MuscleTraning
  def stretch
    puts '胸のストレッチ'
  end

  def main_training
    puts 'ベンチプレス！'
    puts 'チェストプレス！'
  end
end

class ShoulderTraining < MuscleTraning
  def main_training
    puts 'ショルダープレス！'
    puts 'サイドレイズ！'
  end
end

# -- 実行 --
ChestTraining.new.execute
ShoulderTraining.new.execute

=begin -- 実行結果 --
胸のストレッチ
ベンチプレス！
チェストプレス！
プロテイン摂取

全身のストレッチ
ショルダープレス！
サイドレイズ！
プロテイン摂取
=end
