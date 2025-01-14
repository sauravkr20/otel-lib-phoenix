defmodule BookStoreWeb.BookController do
  use BookStoreWeb, :controller
  alias BookStore.Catalog

  def index(conn, _params) do
    books = Catalog.list_books()
    render(conn, :index, books: books)
  end

  def show(conn, %{"id" => id}) do
    book = Catalog.get_book!(id)
    render(conn, :show, book: book)
  end
end
