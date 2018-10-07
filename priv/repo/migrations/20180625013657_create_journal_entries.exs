defmodule Journal.Repo.Migrations.CreateJournalEntries do
  use Ecto.Migration

  def change do
    create table(:entries) do
      add :message, :text
      add :date, :string
      add :title, :string

      timestamps()
    end
  end
end
