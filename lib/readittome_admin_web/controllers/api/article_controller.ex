defmodule ReadittomeAdminWeb.Api.ArticleController do
  use ReadittomeAdminWeb, :controller

  alias ReadittomeAdmin.User

  action_fallback ReadittomeAdminWeb.FallbackController

  def create(conn, article_params) do
    with {:ok, %User.Article{} = article} <- User.create_article(article_params) do
      conn
      |> put_status(:created)
      |> render("show.json", article: article)
    end
  end
end
