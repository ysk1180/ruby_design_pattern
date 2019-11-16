class Item
  attr_reader :name, :price, :observers

  def initialize(name, price)
    @name = name
    @price = price
    @observers = []
  end

  def price=(new_price)
    @price = new_price
    notify_observers
  end

  def notify_observers
    observers.each do |observer|
      observer.update(self) # Observerそれぞれに処理を委譲している
    end
  end

  def add_observer(observer)
    observers << observer
  end
end

class Notification
  def update(changed_item)
    puts "#{changed_item.name}の値段が#{changed_item.price}になったよ！"
  end
end

class DelivaryMethod
  def update(changed_item)
    puts "#{changed_item.name}の値段によって配送方法を分ける処理を書くよ"
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
