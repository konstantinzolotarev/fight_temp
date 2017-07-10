defmodule Server.Web.AuthController do
  use Server.Web, :controller

  def login(conn, _params) do
    conn
    |> text("Ok")
  end

  def logout(conn, _params) do
    conn
    |> text("Loged out")
  end

  def create_player(conn, params) do

    IO.inspect params
    conn
    |> text("Ok")
  end
end
