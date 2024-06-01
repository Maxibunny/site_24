require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "User shouldn't have name" do
    us = User.new(id: 1, email: "Sasha@koshka.ru")
    assert_not us.save, "User shouldn't have name"
  end

  test "User shouldn't have the email" do
    us = User.new(namr: "Sasha")
    assert_not us.save, "User shouldn't have the email"
  end
end
