defmodule Server.AuthControllerTest do
  use Server.Web.ConnCase, async: true

  # alias Server.{Repo, Player}

  setup do
    conn = build_conn() |> put_req_header("content-type", "application/json")
    {:ok, conn: conn}
  end

  test "create_player fail without params", %{conn: conn} do

    url = auth_path(conn, :login)

    response = conn
               |> post(url, Poison.encode!(%{"username" => "", "password" => ""}))
               |> json_response(400)
  end
end
