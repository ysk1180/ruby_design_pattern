# class Sample
#   def method_a
#     # ・・・
#     common
#   end
#
#   private
#
#   def common
#     # ・・・
#     process_a
#   end
#
#   def process_a
#     # ・・・
#     puts 'processAだよ'
#   end
# end
#
# Sample.new.method_b

# ここにpublicなmethod_bを追加したい
# method_b内で、commonメソッドとほぼ同じだけど、process_aメソッドの呼び出しだけprocess_bメソッドに変えた処理を入れたい

# class Sample
#   def method_a
#     # ・・・
#     common
#   end
#
#   # 追加するメソッド
#   def method_b
#     # ここにcommonメソッドとほぼ同じだけど、process_aメソッドの呼び出しだけprocess_bメソッドに変えた処理を入れたい
#   end
#
#   private
#
#   def common
#     # ・・・
#     process_a
#   end
#
#   def process_a
#     # ・・・
#     puts 'processAだよ'
#   end
#
#   # 追加したメソッド
#   def process_b
#     # ・・・
#     puts 'processBだよ'
#   end
# end

# class Sample
#   def method_a
#     # ・・・
#     common_a
#   end
#
#   def method_b
#     # ・・・
#     common_b
#   end
#
#   private
#
#   def common_a
#     # ・・・
#     process_a
#   end
#
#   def common_b
#     # ・・・
#     process_b
#   end
#
#   def process_a
#     # ・・・
#     puts 'processAだよ'
#   end
#
#   def process_b
#     # ・・・
#     puts 'processBだよ'
#   end
# end
#
# Sample.new.method_b

# class Sample
#   def method_a
#     # ・・・
#     common(:a)
#   end
#
#   def method_b
#     # ・・・
#     common(:b)
#   end
#
#   private
#
#   def common(a_or_b)
#     # ・・・
#     send("process_#{a_or_b}")
#   end
#
#   def process_a
#     # ・・・
#     puts 'processAだよ'
#   end
#
#   def process_b
#     # ・・・
#     puts 'processBだよ'
#   end
# end
#
# Sample.new.method_a
# Sample.new.method_b

class Sample
  def method_a
    # ・・・
    common(SampleA.new)
  end

  def method_b
    # ・・・
    common(SampleB.new)
  end

  private

  def common(a_or_b_instance)
    # ・・・
    a_or_b_instance.process
  end
end

class SampleA
  def process
    # ・・・
    puts 'processAだよ'
  end
end

class SampleB
  def process
    # ・・・
    puts 'processBだよ'
  end
end

Sample.new.method_a
Sample.new.method_b

