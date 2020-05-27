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

module ChestTraining
  def stretch
    puts '胸のストレッチ'
  end

  def main_training
    puts 'ベンチプレス！'
    puts 'チェストプレス！'
  end
end

module ShoulderTraining
  def main_training
    puts 'ショルダープレス！'
    puts 'サイドレイズ！'
  end
end

# -- 実行 --
MuscleTraning.new.extend(ChestTraining).execute
MuscleTraning.new.extend(ShoulderTraining).execute
