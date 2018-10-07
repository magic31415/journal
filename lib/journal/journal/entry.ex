  defmodule Journal.Journal.Entry do
  use Ecto.Schema
  import Ecto.Changeset
  alias Journal.Journal.Image

  schema "entries" do
    field :title, :string
    field :message, :string
    field :date, :string
    has_many :images, Image

    timestamps()
  end

  @doc false
  def changeset(entry, attrs) do
    entry
    |> cast(attrs, [:message, :date, :title])
    |> unique_constraint(:message)
    |> unique_constraint(:date)
    |> unique_constraint(:title)
    |> validate_required([:message, :date, :title])
  end
end
