defmodule Server.Web.Router do
  use Server.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Server.Web do
    pipe_through :api
  end
end
