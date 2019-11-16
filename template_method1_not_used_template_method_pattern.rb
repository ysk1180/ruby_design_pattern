class MuscleTraning
  def execute(part)
    case part
    when 'chest'
      puts '胸のストレッチ'
      puts 'ベンチプレス！'
      puts 'チェストプレス！'
    when 'shoulder'
      puts '全身のストレッチ'
      puts 'ショルダープレス！'
      puts 'サイドレイズ！'
    else
      raise "#{part}という部位のトレーニングはまだ知らないよ"
    end
    puts 'プロテイン摂取'
  end
end

# -- 実行 --
MuscleTraning.new.execute('chest')
MuscleTraning.new.execute('shoulder')

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
