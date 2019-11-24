class ArrayIterator
  def initialize(array)
    @array = array
    @index = 0
  end

  def has_next?
    @index < @array.length
  end

  def next_item
    value = @array[@index]
    @index += 1
    value
  end
end

design_patterns = ['template_method', 'strategy', 'observer']

i = ArrayIterator.new(design_patterns)
while i.has_next?
  puts "#{i.next_item} is one of design patterns"
end
