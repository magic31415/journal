defmodule Journal.Repo.Migrations.AllowLongerEntries do
  use Ecto.Migration

  def change do
    alter table(:entries) do
      modify :message, :text
    end
  end
end
