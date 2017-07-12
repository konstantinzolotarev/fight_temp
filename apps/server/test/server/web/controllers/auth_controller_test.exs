defmodule Server.AuthControllerTest do
  use Server.Web.ConnCase, async: true

  # alias Server.{Repo, Player}

  test "create_player fail without params" do

    response = build_conn()
    |> post(auth_path(build_conn(), :login))
    |> json_response(200)
  end
end
