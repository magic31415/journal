defmodule Journal.Repo.Migrations.AddImages do
  use Ecto.Migration

  def change do
    create table(:images) do
      add :caption, :text, null: true
      add :entry_id, :id

      timestamps()
    end
  end
end
