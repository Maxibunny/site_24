require "test_helper"

class ArticleTest < ActiveSupport::TestCase

  test "Can't have articles with the same title" do
    art1 = Article.create(title: "New title", body: "123456789 987654321")
    art2 = Article.new(title: "New title", body: "123456789 987654321")
    assert_not art2.save, "Can't have articles with the same title"
  end

  test "Can't create articles without title" do
    art = Article.new(body: "123456789 987654321")
    assert_not art.save, "Cant't have articles without title"
  end

  test "Can't create articles with empty body" do
    art = Article.new(title: "New title")
    assert_not art.save, "Can't create articles with empty body"
  end
end
