defmodule Server.Web.AuthController do
  use Server.Web, :controller

  def login(conn, _params) do
    conn
    |> text("Ok")
  end
end
