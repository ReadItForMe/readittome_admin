defmodule ReadittomeAdminWeb.Router do
  use ReadittomeAdminWeb, :router

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

  scope "/", ReadittomeAdminWeb do
    pipe_through :browser

    resources "/articles", ArticleController
  end

  scope "/api", ReadittomeAdminWeb.Api, as: :api do
    pipe_through :api

    resources "/articles", ArticleController, only: [:create]
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: ReadittomeAdminWeb.Telemetry
    end
  end
end
