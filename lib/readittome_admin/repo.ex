defmodule ReadittomeAdmin.Repo do
  use Ecto.Repo,
    otp_app: :readittome_admin,
    adapter: Ecto.Adapters.Postgres
end
