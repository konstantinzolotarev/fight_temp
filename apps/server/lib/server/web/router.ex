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

    post "/login", AuthController, :login
    post "/register", AuthController, :create_player
  end

  scope "/", Server.Web do  
    pipe_through :api_auth

    get "/logout", AuthController, :logout
  end
end
