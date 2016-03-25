require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
	def setup
		@user = User.new(name: "Example User", email: "user@example.com", 
			password: "foobards", password_confirmation: "foobards")
	end

	test "should be valid" do
		assert @user.valid?
	end

	test "name should be valid" do
		@user.name = "   "
		assert_not @user.valid?
	end

	test "email should be present" do
		@user.email = " "
		assert_not @user.valid?
	end
	
	test "name should be 80 characters" do
		@user.name = "a" * 81
		assert_not @user.valid?
	end

	test "email should be 255 characters" do
		@user.name = "a" * 244 + "@example.com"
		assert_not @user.valid?
	end

	test "email format" do
		valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.orr first.last@foo.jp alice+bob@baz.cn]
		valid_addresses.each do |x|
			@user.email = x
			assert @user.valid?, "#{x.inspect} should be valid"
		end
	end

	test "invalid emails" do
		invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
		invalid_addresses.each do |invalid_email|
		    @user.email = invalid_email
			assert_not @user.valid?, "#{invalid_email} should be invalid"
		end
	end

	test "email addresses should be unique" do
	    duplicate_user = @user.dup
	    duplicate_user.email = @user.email.upcase
	    @user.save
	    assert_not duplicate_user.valid?
  end

  test "password should exist" do
  	@user.password = @user.password_confirmation = " " * 5
  	assert_not @user.valid?
  end

  test "password should be 8 characters long" do
  	@user.password = @user.password_confirmation = "a" * 7
  	assert_not @user.valid?
  end

end
