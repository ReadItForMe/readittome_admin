defmodule ReadittomeAdmin.Repo.Migrations.CreateArticles do
  use Ecto.Migration

  def change do
    create table(:articles, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :url, :string
      add :send, :boolean, default: false, null: false
      add :email, :string

      timestamps()
    end

  end
end
