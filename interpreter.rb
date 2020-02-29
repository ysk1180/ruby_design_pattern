class Word
  def initialize(value)
    @value = value
  end

  def execute
    @value
  end
end

class Plus
  def initialize(first, second)
    @first = first
    @second = second
  end

  def execute
    @first.execute + @second.execute
  end
end

class Minus
  def initialize(first, second)
    @first = first
    @second = second
  end

  def execute
    index = @first.execute =~ /#{@second.execute}/
    second_index = index + @second.execute.length
    @first.execute[0,index] + @first.execute[second_index..-1]
  end
end

class Interpreter
  def self.parse(input)
    @waiting_second_word = false
    words = []
    operations = []
    input.split.each do |value|
      if value =~ /^[^+-].*/ && !@waiting_second_word
        words << Word.new(value)
      else
        if symbol = operations.pop()
          first = words.pop
          second = Word.new(value)
          case symbol
          when /\A\+/
            words << Word.new(Plus.new(first, second).execute)
          when /\A\-/
            words << Word.new(Minus.new(first, second).execute)
          end
          @waiting_second_word = false
        else
          @waiting_second_word = true
          operations << value
        end
      end
    end
    words.pop.execute
  end
end

puts Interpreter.parse("おはよう + ございます - ござい")
