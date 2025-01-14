defmodule BookStore.BooksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BookStore.Books` context.
  """

  @doc """
  Generate a book.
  """
  def book_fixture(attrs \\ %{}) do
    {:ok, book} =
      attrs
      |> Enum.into(%{
        title: "some title"
      })
      |> BookStore.Books.create_book()

    book
  end
end
