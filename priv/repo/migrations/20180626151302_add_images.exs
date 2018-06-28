defmodule Journal.Repo.Migrations.AddImages do
  use Ecto.Migration

  def change do
    create table(:images) do
      add :caption, :text
      add :journal_entry_id, references(:journal_entries, on_delete: :delete_all)

      timestamps()
    end

    create index(:images, [:journal_entry_id])
  end
end
