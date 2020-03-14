class Object
  def self.metapro_reader(name)
    code = "def #{name}
              @#{name}
            end"
    class_eval(code)
  end
end

class User
  metapro_reader :name

  def initialize(name)
    @name = name
  end
end

user = User.new('メタプロくん')
puts user.name
