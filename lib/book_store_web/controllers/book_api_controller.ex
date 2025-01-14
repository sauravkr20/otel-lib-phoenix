defmodule BookStoreWeb.BookAPIController do
  use BookStoreWeb, :controller
  alias BookStore.Catalog

  def index(conn, _params) do
    books = Catalog.list_books()
    render(conn, :index, books: books)
  end

  def create(conn, %{"book" => book_params}) do
    with {:ok, book} <- Catalog.create_book(book_params) do
      conn
      |> put_status(:created)
      |> render(:show, book: book)
    end
  end

  def show(conn, %{"id" => id}) do
    book = Catalog.get_book!(id)
    render(conn, :show, book: book)
  end

  def update(conn, %{"id" => id, "book" => book_params}) do
    book = Catalog.get_book!(id)

    with {:ok, book} <- Catalog.update_book(book, book_params) do
      render(conn, :show, book: book)
    end
  end

  def delete(conn, %{"id" => id}) do
    book = Catalog.get_book!(id)

    with {:ok, _book} <- Catalog.delete_book(book) do
      send_resp(conn, :no_content, "")
    end
  end
end
