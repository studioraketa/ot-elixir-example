defmodule RollDiceWeb.DiceControllerTest do
  use RollDiceWeb.ConnCase

  import RollDice.CatalogFixtures

  @create_attrs %{name: "some name", sides: 42}
  @update_attrs %{name: "some updated name", sides: 43}
  @invalid_attrs %{name: nil, sides: nil}

  describe "index" do
    test "lists all dices", %{conn: conn} do
      conn = get(conn, ~p"/dices")
      assert html_response(conn, 200) =~ "Listing Dices"
    end
  end

  describe "new dice" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/dices/new")
      assert html_response(conn, 200) =~ "New Dice"
    end
  end

  describe "create dice" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/dices", dice: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/dices/#{id}"

      conn = get(conn, ~p"/dices/#{id}")
      assert html_response(conn, 200) =~ "Dice #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/dices", dice: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Dice"
    end
  end

  describe "edit dice" do
    setup [:create_dice]

    test "renders form for editing chosen dice", %{conn: conn, dice: dice} do
      conn = get(conn, ~p"/dices/#{dice}/edit")
      assert html_response(conn, 200) =~ "Edit Dice"
    end
  end

  describe "update dice" do
    setup [:create_dice]

    test "redirects when data is valid", %{conn: conn, dice: dice} do
      conn = put(conn, ~p"/dices/#{dice}", dice: @update_attrs)
      assert redirected_to(conn) == ~p"/dices/#{dice}"

      conn = get(conn, ~p"/dices/#{dice}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, dice: dice} do
      conn = put(conn, ~p"/dices/#{dice}", dice: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Dice"
    end
  end

  describe "delete dice" do
    setup [:create_dice]

    test "deletes chosen dice", %{conn: conn, dice: dice} do
      conn = delete(conn, ~p"/dices/#{dice}")
      assert redirected_to(conn) == ~p"/dices"

      assert_error_sent 404, fn ->
        get(conn, ~p"/dices/#{dice}")
      end
    end
  end

  defp create_dice(_) do
    dice = dice_fixture()
    %{dice: dice}
  end
end
