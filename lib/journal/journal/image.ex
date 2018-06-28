defmodule Journal.Journal.Image do
  use Ecto.Schema
  import Ecto.Changeset


  schema "images" do
    field :caption, :string
    belongs_to :journal_entry, Journal.Journal.Entry

    timestamps()
  end

  @doc false
  def changeset(image, attrs) do
    image
    |> cast(attrs, [:caption, :journal_entry_id])
    |> validate_required([:caption, :journal_entry_id])
  end
end
