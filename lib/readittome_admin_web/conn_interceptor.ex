defmodule ReadittomeAdminWeb.ConnInterceptor do
  import Plug.Conn, only: [assign: 3]

  require Logger

  def init(default), do: default

  def call(conn, _default) do
    Logger.info(Kernel.inspect(conn))
    conn
  end
end
