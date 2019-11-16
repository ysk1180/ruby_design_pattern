class Item
  attr_reader :name, :price, :notification

  def initialize(name, price, notification)
    @name = name
    @price = price
    @notification = notification
  end

  def price=(new_price)
    @price = new_price
    notification.update(self) # 通知の処理は、Notificationクラスに委譲している
  end
end

class Notification
  def update(changed_item)
    puts "#{changed_item.name}の値段が#{changed_item.price}円になったよ！"
  end
end

# -- 実行 --
item = Item.new('ダンベル', 3000, Notification.new)
item.price = 2500

=begin -- 実行結果 --
ダンベルの値段が2500円になったよ！
=end
