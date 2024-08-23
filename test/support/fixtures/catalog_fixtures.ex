defmodule RollDice.CatalogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `RollDice.Catalog` context.
  """

  @doc """
  Generate a dice.
  """
  def dice_fixture(attrs \\ %{}) do
    {:ok, dice} =
      attrs
      |> Enum.into(%{
        name: "some name",
        sides: 42
      })
      |> RollDice.Catalog.create_dice()

    dice
  end
end
