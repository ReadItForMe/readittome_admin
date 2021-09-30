defmodule ReadittomeAdmin.Repo.Migrations.ModifyArticlesTable do
  use Ecto.Migration

  def change do
    alter table("articles") do
      modify :url, :string, size: 400
    end
  end
end
