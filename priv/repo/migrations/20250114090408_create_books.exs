defmodule BookStore.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :title, :string, null: false
      add :author, :string, null: false
      add :isbn, :string, null: false

      timestamps()
    end

    create unique_index(:books, [:isbn])
  end
end
