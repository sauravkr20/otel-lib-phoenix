defmodule BookStoreWeb.Router do
  use BookStoreWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {BookStoreWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BookStoreWeb do
    pipe_through :browser

    get "/", PageController, :home
    resources "/books", BookController, only: [:index, :show]
  end

  scope "/api", BookStoreWeb do
    pipe_through :api

    resources "/books", BookAPIController, except: [:new, :edit]
  end
end
