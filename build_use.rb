class User
  attr_accessor :first_name, :last_name, :birthday, :gender, :status, :email, :password
end

class UserBuilder
  attr_reader :user

  def initialize
    @user = User.new
  end

  def set_name(first_name, last_name)
    @user.first_name = first_name
    @user.last_name = last_name
  end

  def set_birthday(birthday)
    @user.birthday = birthday
  end

  def set_as_man
    @user.gender = 1
  end

  def set_as_woman
    @user.gender = 2
  end

  def set_as_active
    @user.status = 1
  end

  def set_login_credectiols(email, password)
    @user.email = email
    @user.password = password
  end
end

user_builder = UserBuilder.new
user_builder.set_name('テスト', '太郎')
user_builder.set_as_man
user_builder.set_as_active
user_builder.set_login_credectiols('test@example.com', 'pass1234')
user = user_builder
p user
