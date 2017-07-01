defmodule Server.Web.Router do
  use Server.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Server.Web do
    pipe_through :api

    get "/", IndexController, :index
  end
end
