defmodule RollDice.CatalogTest do
  use RollDice.DataCase

  alias RollDice.Catalog

  describe "dices" do
    alias RollDice.Catalog.Dice

    import RollDice.CatalogFixtures

    @invalid_attrs %{name: nil, sides: nil}

    test "list_dices/0 returns all dices" do
      dice = dice_fixture()
      assert Catalog.list_dices() == [dice]
    end

    test "get_dice!/1 returns the dice with given id" do
      dice = dice_fixture()
      assert Catalog.get_dice!(dice.id) == dice
    end

    test "create_dice/1 with valid data creates a dice" do
      valid_attrs = %{name: "some name", sides: 42}

      assert {:ok, %Dice{} = dice} = Catalog.create_dice(valid_attrs)
      assert dice.name == "some name"
      assert dice.sides == 42
    end

    test "create_dice/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalog.create_dice(@invalid_attrs)
    end

    test "update_dice/2 with valid data updates the dice" do
      dice = dice_fixture()
      update_attrs = %{name: "some updated name", sides: 43}

      assert {:ok, %Dice{} = dice} = Catalog.update_dice(dice, update_attrs)
      assert dice.name == "some updated name"
      assert dice.sides == 43
    end

    test "update_dice/2 with invalid data returns error changeset" do
      dice = dice_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalog.update_dice(dice, @invalid_attrs)
      assert dice == Catalog.get_dice!(dice.id)
    end

    test "delete_dice/1 deletes the dice" do
      dice = dice_fixture()
      assert {:ok, %Dice{}} = Catalog.delete_dice(dice)
      assert_raise Ecto.NoResultsError, fn -> Catalog.get_dice!(dice.id) end
    end

    test "change_dice/1 returns a dice changeset" do
      dice = dice_fixture()
      assert %Ecto.Changeset{} = Catalog.change_dice(dice)
    end
  end
end
