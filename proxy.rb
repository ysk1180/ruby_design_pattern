class Item
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def buy
    puts "商品「#{name}」を購入するよ"
  end

  def comment
    puts "商品「#{name}」にコメントするよ"
  end
end

item = Item.new('MacBook Air')
item.buy
item.comment

class ItemProxy
  attr_reader :item, :user_name

  def initialize(item, user_name = nil)
    @item = item
    @user_name = user_name
  end

  def buy
    check_login
    item.buy
  end

  def comment
    check_login
    item.comment
  end

  private

  def check_login
    raise 'ログインしてください' unless login?
  end

  def login?
    user_name == 'ログインユーザー' # 本来はここでログインユーザーかどうか確かめるロジックを書く
  end
end

proxy = ItemProxy.new(item)
proxy.buy
proxy.comment

proxy2 = ItemProxy.new(item, 'ログインユーザー')
proxy2.buy
proxy2.comment

# method_missingを使ってリファクタリング
class ItemProxy2
  attr_reader :item, :user_name

  def initialize(item, user_name = nil)
    @item = item
    @user_name = user_name
  end

  def method_missing(name, *args)
    check_login
    item.send(name, *args)
  end

  private

  def check_login
    raise 'ログインしてください' unless login?
  end

  def login?
    user_name == 'ログインユーザー' # 本来はここでログインユーザーかどうか確かめるロジックを書く
  end
end

proxy3 = ItemProxy2.new(item, 'ログインユーザー')
proxy3.buy
proxy3.comment

