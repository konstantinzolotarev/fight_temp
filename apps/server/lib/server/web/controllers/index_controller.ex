defmodule Server.Web.IndexController do
  use Server.Web, :controller

  def index(conn, _params) do
    conn
    |> text("Hello")
  end
end
