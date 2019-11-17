# Componentクラス
class Part
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def price
    raise # インターフェイスとなるメソッドであり、呼び出されたらエラーを返すようにしている
  end
end

# Compositeクラスの基底クラス
class CompositePart < Part
  def initialize(name)
    super(name)
    @sub_parts = []
  end

  def add_sub_part(part)
    @sub_parts << part
  end

  def remove_sub_part(part)
    @sub_parts.delete(part)
  end

  def price
    @sub_parts.map(&:price).inject(:+) # 子クラスのpriceを集計
  end
end

# Compositeクラス
class ClubSet < CompositePart
  def initialize
    super('クラブセット')
    add_sub_part(Club.new)
    add_sub_part(GolfBag.new)
  end
end

# Leafクラス
class GolfBag < Part
  def initialize
    super('ゴルフバッグ')
  end

  def price
    10_000
  end
end

# Compositeクラス
class Club < CompositePart
  def initialize
    super('クラブ')
    add_sub_part(Driver.new)
    add_sub_part(Iron.new)
  end
end

# Leafクラス
class Driver < Part
  def initialize
    super('ドライバー')
  end

  def price
    30_000
  end
end

# Leafクラス
class Iron < Part
  def initialize
    super('アイアン')
  end

  def price
    15_000
  end
end

# -- 実行 --
p ClubSet.new.price # -> 55000
p GolfBag.new.price # -> 10000
p Club.new.price # -> 45000
