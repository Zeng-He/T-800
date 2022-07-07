defmodule HelloWeb.TransactionControllerTest do
  use HelloWeb.ConnCase

  @valid_attrs %{form_data: %{tx_hash: "0xe9fd6779e275338fa82d960f74457d50d59841fd11313a78a96a5d9c30769b53"}}
  @invalid_attrs %{form_data: %{tx_hash: "0xdf4f159835c4cdb03cca85672d196a952ebe3a1c6e9d17b3114989ded28be433"}}

  test "GET /transaction/", %{conn: conn} do
    conn = get(conn, "/transaction/")
    assert html_response(conn, 200) =~ "Enter a transaction hash and check if is valid"
  end

  test "POST /transaction/result SUCESS", %{conn: conn} do
    conn = post(conn, "/transaction/result", %{form_data: %{tx_hash: "0x0"}})
    assert html_response(conn, 200) =~ "Enter a transaction hash and check if is valid"
    assert html_response(conn, 200) =~ "Great! your transaction has made it through :)"
  end

  test "POST /transaction/result Failure", %{conn: conn} do
    conn = post(conn, "/transaction/result", @invalid_attrs)
    assert html_response(conn, 200) =~ "Enter a transaction hash and check if is valid"
    assert html_response(conn, 200) =~ "Unfortunatelly the transaction has been reverted"
  end
end
