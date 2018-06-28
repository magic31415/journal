defmodule Journal.Repo.Migrations.AddEntryTitle do
  use Ecto.Migration

  def change do
    alter table(:journal_entries) do
  		add :title, :string
  	end
  end
end
