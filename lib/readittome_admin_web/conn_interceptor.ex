defmodule ReadittomeAdminWeb.ConnInterceptor do
  import Plug.Conn, only: [assign: 3]

  require Logger

  def init(default), do: default

  def call(conn, default) do
    Logger.info(default)
    Logger.info(conn)
    conn
  end
end
