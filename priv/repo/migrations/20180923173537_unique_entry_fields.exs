defmodule Journal.Repo.Migrations.UniqueEntryFields do
  use Ecto.Migration

  def change do
    create unique_index(:entries, [:title])
    create unique_index(:entries, [:message])
    create unique_index(:entries, [:date])
  end
end
