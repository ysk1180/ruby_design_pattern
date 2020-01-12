require 'singleton'

class Dumbbell
  include Singleton

  def initialize
    @usable = true # ダンベルを使用できるかどうか
  end

  def borrow
    if @usable
      @usable = false
      puts 'ダンベルを借りたよ。筋トレファイト！'
    else
      puts 'ダンベルはレンタル中だよ。他の筋トレをしよう！'
    end
  end

  def return
    @usable = true
    puts 'ダンベルを返却したよ。お疲れさま！'
  end
end

Dumbbell.instance.borrow
Dumbbell.instance.borrow
Dumbbell.instance.return
# Dumbbell.new.return
