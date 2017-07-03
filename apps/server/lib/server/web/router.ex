defmodule Server.Web.Router do
  use Server.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :api_auth do
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
  end

  scope "/", Server.Web do
    pipe_through :api

    get "/", IndexController, :index
  end
end
