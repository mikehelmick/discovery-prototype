defmodule DiscoveryWeb.Router do
  use DiscoveryWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api



    forward "/api", Absinthe.Plug,
      schema: DiscoveryWeb.Schema

    forward "/", Absinthe.Plug.GraphiQL,
      schema: DiscoveryWeb.Schema,
      interface: :simple
  end

  # Other scopes may use custom stacks.
  # scope "/api", DiscoveryWeb do
  #   pipe_through :api
  # end
end
