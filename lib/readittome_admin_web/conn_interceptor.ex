defmodule ReadittomeAdminWeb.ConnInterceptor do
  import Plug.Conn, only: [assign: 3]

  require Logger

  def init(default), do: default

  def call(conn, _default) do
    Logger.info(Enum.map_join(conn, ", ", fn {key, val} -> ~s{"#{key}", "#{val}"} end))
    conn
  end
end
