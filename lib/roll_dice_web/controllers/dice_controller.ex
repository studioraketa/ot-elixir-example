defmodule RollDiceWeb.DiceController do
  use RollDiceWeb, :controller

  alias RollDice.Catalog
  alias RollDice.Catalog.Dice

  def index(conn, _params) do
    dices = Catalog.list_dices()
    render(conn, :index, dices: dices)
  end

  def new(conn, _params) do
    changeset = Catalog.change_dice(%Dice{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"dice" => dice_params}) do
    case Catalog.create_dice(dice_params) do
      {:ok, dice} ->
        conn
        |> put_flash(:info, "Dice created successfully.")
        |> redirect(to: ~p"/dices/#{dice}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    dice = Catalog.get_dice!(id)
    render(conn, :show, dice: dice)
  end

  def edit(conn, %{"id" => id}) do
    dice = Catalog.get_dice!(id)
    changeset = Catalog.change_dice(dice)
    render(conn, :edit, dice: dice, changeset: changeset)
  end

  def update(conn, %{"id" => id, "dice" => dice_params}) do
    dice = Catalog.get_dice!(id)

    case Catalog.update_dice(dice, dice_params) do
      {:ok, dice} ->
        conn
        |> put_flash(:info, "Dice updated successfully.")
        |> redirect(to: ~p"/dices/#{dice}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, dice: dice, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    dice = Catalog.get_dice!(id)
    {:ok, _dice} = Catalog.delete_dice(dice)

    conn
    |> put_flash(:info, "Dice deleted successfully.")
    |> redirect(to: ~p"/dices")
  end
end
