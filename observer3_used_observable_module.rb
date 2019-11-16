require 'observer'

class Item
  include Observable

  attr_reader :name, :price, :observers

  def initialize(name, price)
    @name = name
    @price = price
  end

  def price=(new_price)
    @price = new_price
    changed # changeeメソッドを呼ぶことで、オブジェクトに変更があることを伝えている
    notify_observers(self)
  end
end

class Notification
  def update(changed_item)
    puts "#{changed_item.name}の値段が#{changed_item.price}になったよ！"
  end
end

class DelivaryMethod
  def update(changed_item)
    puts "#{changed_item.name}のの値段によって配送方法を分ける処理を書くよ"
  end
end

# -- 実行 --
item = Item.new('ダンベル', 3000)
item.add_observer(Notification.new)
item.add_observer(DelivaryMethod.new)
item.price = 2500

=begin -- 実行結果 --
ダンベルの値段が2500円になったよ！
ダンベルの値段によって配送方法を分ける処理を書くよ
=end
