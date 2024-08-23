defmodule RollDice.Catalog do
  @moduledoc """
  The Catalog context.
  """

  import Ecto.Query, warn: false
  alias RollDice.Repo

  alias RollDice.Catalog.Dice

  @doc """
  Returns the list of dices.

  ## Examples

      iex> list_dices()
      [%Dice{}, ...]

  """
  def list_dices do
    Repo.all(Dice)
  end

  @doc """
  Gets a single dice.

  Raises `Ecto.NoResultsError` if the Dice does not exist.

  ## Examples

      iex> get_dice!(123)
      %Dice{}

      iex> get_dice!(456)
      ** (Ecto.NoResultsError)

  """
  def get_dice!(id), do: Repo.get!(Dice, id)

  @doc """
  Creates a dice.

  ## Examples

      iex> create_dice(%{field: value})
      {:ok, %Dice{}}

      iex> create_dice(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_dice(attrs \\ %{}) do
    %Dice{}
    |> Dice.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a dice.

  ## Examples

      iex> update_dice(dice, %{field: new_value})
      {:ok, %Dice{}}

      iex> update_dice(dice, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_dice(%Dice{} = dice, attrs) do
    dice
    |> Dice.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a dice.

  ## Examples

      iex> delete_dice(dice)
      {:ok, %Dice{}}

      iex> delete_dice(dice)
      {:error, %Ecto.Changeset{}}

  """
  def delete_dice(%Dice{} = dice) do
    Repo.delete(dice)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking dice changes.

  ## Examples

      iex> change_dice(dice)
      %Ecto.Changeset{data: %Dice{}}

  """
  def change_dice(%Dice{} = dice, attrs \\ %{}) do
    Dice.changeset(dice, attrs)
  end
end
