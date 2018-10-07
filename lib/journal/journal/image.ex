defmodule Journal.Journal.Image do
  use Ecto.Schema
  import Ecto.Changeset
  alias Journal.Journal.Entry

  schema "images" do
    field :caption, :string
    belongs_to :entry, Entry

    timestamps()
  end

  @doc false
  def changeset(image, attrs) do
    image
    |> cast(attrs, [:caption, :entry])
    |> validate_required([:entry])
  end
end

