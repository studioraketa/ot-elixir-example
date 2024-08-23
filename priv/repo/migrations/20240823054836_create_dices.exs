defmodule RollDice.Repo.Migrations.CreateDices do
  use Ecto.Migration

  def change do
    create table(:dices) do
      add :name, :string
      add :sides, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
