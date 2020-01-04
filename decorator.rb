class Notifier
  def send(message)
    puts "サービス内で「#{message}」を通知するよ"
  end

  def stop
    puts '通知を止めるよ'
  end
end

class NotifierDecorator
  attr_reader :notifiler

  def initialize(notifiler)
    @notifiler = notifiler
  end

  def send(message)
    notifiler.send(message)
  end

  def stop
    notifiler.stop
  end
end

# コメントアウトしてる部分はForwardableモジュールを使ったリファクタリング
# require 'forwardable'
#
# class NotifierDecorator
#   extend Forwardable
#   attr_reader :notifiler
#
#   def_delegators :notifiler, :send, :stop
#
#   def initialize(notifiler)
#     @notifiler = notifiler
#   end
# end


class SlackNotifier < NotifierDecorator
  def send(message)
    puts "slackで「#{message}」を通知するよ"
    notifiler.send(message)
  end
end

class MailNotifier < NotifierDecorator
  def send(message)
    puts "メールで「#{message}」を通知するよ"
    notifiler.send(message)
  end
end

notifier = MailNotifier.new(SlackNotifier.new(Notifier.new))
notifier.send('投稿にいいねがつきました！')
puts '---'
notifier.stop
