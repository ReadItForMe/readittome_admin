defmodule ReadittomeAdmin.User.Article do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "articles" do
    field :email, :string
    field :send, :boolean, default: false
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(article, attrs) do
    article
    |> cast(attrs, [:url, :send, :email])
    |> validate_required([:url, :send, :email])
  end
end
