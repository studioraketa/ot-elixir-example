defmodule RollDice.Catalog.Dice do
  use Ecto.Schema
  import Ecto.Changeset

  schema "dices" do
    field :name, :string
    field :sides, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(dice, attrs) do
    dice
    |> cast(attrs, [:name, :sides])
    |> validate_required([:name, :sides])
  end
end
