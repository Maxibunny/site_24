require "test_helper"

class UserTest < ActiveSupport::TestCase

  test "user should be valid" do
    user = User.new(email: "test@example.com", password: "password", password_confirmation: "password")
    assert user.valid?
  end

  test "user should not be valid without an email" do
    user = User.new(password: "password", password_confirmation: "password")
    assert_not user.valid?
  end

  test "user should not be valid with invalid email format" do
    user = User.new(email: "invalid_email", password: "password", password_confirmation: "password")
    assert_not user.valid?
  end

  test "user should not be valid without a password" do
    user = User.new(email: "test@example.com")
    assert_not user.valid?
  end

  test "user should not be valid with a short password" do
    user = User.new(email: "test@example.com", password: "short", password_confirmation: "short")
    assert_not user.valid?
  end

  test "paswords must match" do
    user = User.new(email: "test@example.com", password:"password", pasword_confirmation: "passwordwrong")
    assert_not user.valid?
  end

end
