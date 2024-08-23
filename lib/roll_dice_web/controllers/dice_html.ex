defmodule RollDiceWeb.DiceHTML do
  use RollDiceWeb, :html

  embed_templates "dice_html/*"

  @doc """
  Renders a dice form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def dice_form(assigns)
end
