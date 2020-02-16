class User
  attr_accessor :first_name, :last_name, :birthday, :gender, :status, :email, :password

  def initialize(first_name, last_name, birthday, gender, status, email, password)
    @first_name = first_name
    @last_name = last_name
    @birthday = birthday
    @gender = gender
    @status = status
    @email = email
    @password = password
  end
end

user = User.new('テスト', '太郎', '1991-08-11', 1, 1, 'test@example.com', 'pass1234')
p user
