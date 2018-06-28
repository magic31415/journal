defmodule Journal.Repo.Migrations.TextForMessages do
  use Ecto.Migration

  def change do
  	alter table(:journal_entries) do
  	remove :message
  	add :message, :text
  end
  end
end
