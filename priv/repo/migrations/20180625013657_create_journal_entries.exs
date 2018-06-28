defmodule Journal.Repo.Migrations.CreateJournalEntries do
  use Ecto.Migration

  def change do
    create table(:journal_entries) do
      add :message, :string
      add :date, :string

      timestamps()
    end

  end
end
