class Command
  def execute
    raise 'メソッドが定義されていないよ'
  end
end

class EnglishCommand < Command
  def execute
    puts 'オンライン英会話レッスンを行う'
  end
end

class AtcoderCommand < Command
  def execute
    puts '過去問を解く'
  end
end

class Study
  attr_reader :command

  def initialize(command)
    @command = command
  end

  def do
    command.execute
  end
end

Study.new(EnglishCommand.new).do
Study.new(AtcoderCommand.new).do
