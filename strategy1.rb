class Sport
  attr_accessor :sport, :before_practice

  def initialize(sport)
    @sport = sport
    @before_practice = 'ストレッチをする'
  end

  def practice
    sport.practice(before_practice) # 詳細を知っている別のクラスのメソッドに処理を移譲している
  end
end

class Golf
  def practice(before_practice)
    puts before_practice
    puts 'アイアンの練習'
    puts 'ドライバーの練習'
  end
end

class Badminton
  def practice(before_practice)
    puts before_practice
    puts 'スマッシュの練習'
    puts 'ヘアピンの練習'
  end
end

# -- 実行 --
Sport.new(Golf.new).practice
Sport.new(Badminton.new).practice

=begin -- 実行結果 --
ストレッチをする
アイアンの練習
ドライバーの練習

ストレッチをする
スマッシュの練習
ヘアピンの練習
=end
