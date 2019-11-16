class Sport
  attr_accessor :sport, :before_practice

  def initialize(&sport)
    @sport = sport
    @before_practice = 'ストレッチをする'
  end

  def practice
    sport.call(self) # 詳細を知っている別のクラスのメソッドに処理を移譲している
  end
end

# -- 実行 --
Sport.new do |context|
  puts context.before_practice
  puts 'アイアンの練習'
  puts 'ドライバーの練習'
end.practice

Sport.new do |context|
  puts context.before_practice
  puts 'スマッシュの練習'
  puts 'ヘアピンの練習'
end.practice

=begin -- 実行結果 --
ストレッチをする
アイアンの練習
ドライバーの練習

ストレッチをする
スマッシュの練習
ヘアピンの練習
=end
