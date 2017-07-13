defmodule Server.Web.AuthController do
  use Server.Web, :controller
  plug :scrub_params, "player" when action in [:create_player]

  def login(conn, %{"username" => username, "password" => password} = params) do
    conn
    |> json(%{data: "ok"})
  end

  def logout(conn, _params) do
    conn
    |> text("Loged out")
  end

  def create_player(conn, %{"player" => player}) do

    IO.inspect player
    conn
    |> text("Ok")
  end
end
