defmodule ReadittomeAdminWeb.ConnInterceptor do
  import Plug.Conn, only: [assign: 3]

  def init(default), do: default

  def call(conn, _default) do
    require IEx
    IEx.pry
    conn
  end
end
