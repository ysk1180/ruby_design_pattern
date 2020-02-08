require 'json'

# ファクトリメソッドパターンを使わないサンプル
# class Report
#   def self.generate(data, type)
#     case type
#     when 'json'
#       data.to_json
#     when 'csv'
#       data.keys.join(',') + "\n" + data.values.join(',')
#     end
#   end
# end

# ファクトリメソッドを使って書き換えたサンプル
class Formatter
  def self.type(type)
    case type
    when 'json'
      JsonFormatter.new
    when 'csv'
      CsvFormatter.new
    end
  end
end

class JsonFormatter
  def format(data)
    data.to_json
  end
end

class CsvFormatter
  def format(data)
    data.keys.join(',') + "\n" + data.values.join(',')
  end
end

class Report
  def self.generate(data, type)
    Formatter.type(type).format(data)
  end
end

data = {age: 28, hobby: 'golf'}

puts Report.generate(data, 'json')
puts '---'
puts Report.generate(data, 'csv')
