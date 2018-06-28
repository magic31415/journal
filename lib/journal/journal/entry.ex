defmodule Journal.Journal.Entry do
  use Ecto.Schema
  import Ecto.Changeset


  schema "journal_entries" do
    field :title, :string
    field :message, :string
    field :date, :string
    has_many :images, Journal.Journal.Image

    timestamps()
  end

  @doc false
  def changeset(entry, attrs) do
    entry
    |> cast(attrs, [:message, :date, :title])
    |> validate_required([:message, :date, :title])
  end
end
