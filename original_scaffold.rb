name = ARGV[0]
class_name = name.capitalize + 'Controller'
file_name = name + '_controller.rb'

content = <<-"EOS"
class #{class_name}
  def hello
    puts 'Hello!'
  end
end
EOS

File.open(file_name, 'w') do |f|
  f.write(content)
end
