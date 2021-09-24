defmodule ReadittomeAdmin.UserTest do
  use ReadittomeAdmin.DataCase

  alias ReadittomeAdmin.User

  describe "articles" do
    alias ReadittomeAdmin.User.Article

    @valid_attrs %{email: "some email", send: true, url: "some url"}
    @update_attrs %{email: "some updated email", send: false, url: "some updated url"}
    @invalid_attrs %{email: nil, send: nil, url: nil}

    def article_fixture(attrs \\ %{}) do
      {:ok, article} =
        attrs
        |> Enum.into(@valid_attrs)
        |> User.create_article()

      article
    end

    test "list_articles/0 returns all articles" do
      article = article_fixture()
      assert User.list_articles() == [article]
    end

    test "get_article!/1 returns the article with given id" do
      article = article_fixture()
      assert User.get_article!(article.id) == article
    end

    test "create_article/1 with valid data creates a article" do
      assert {:ok, %Article{} = article} = User.create_article(@valid_attrs)
      assert article.email == "some email"
      assert article.send == true
      assert article.url == "some url"
    end

    test "create_article/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = User.create_article(@invalid_attrs)
    end

    test "update_article/2 with valid data updates the article" do
      article = article_fixture()
      assert {:ok, %Article{} = article} = User.update_article(article, @update_attrs)
      assert article.email == "some updated email"
      assert article.send == false
      assert article.url == "some updated url"
    end

    test "update_article/2 with invalid data returns error changeset" do
      article = article_fixture()
      assert {:error, %Ecto.Changeset{}} = User.update_article(article, @invalid_attrs)
      assert article == User.get_article!(article.id)
    end

    test "delete_article/1 deletes the article" do
      article = article_fixture()
      assert {:ok, %Article{}} = User.delete_article(article)
      assert_raise Ecto.NoResultsError, fn -> User.get_article!(article.id) end
    end

    test "change_article/1 returns a article changeset" do
      article = article_fixture()
      assert %Ecto.Changeset{} = User.change_article(article)
    end
  end
end
