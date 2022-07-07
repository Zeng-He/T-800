defmodule HelloWeb.TransactionController do
  use HelloWeb, :controller

  def index(conn, _params) do
    conn
    |> render("index.html", csrf: csrf_token(conn), result_is_present: false)
  end

  def result(conn, %{"form_data" => %{"tx_hash" => hash}}) do
    txhash = hash
    apikey = Application.fetch_env!(:transaction_config, :etherscan_api_key)
    url = "https://api.etherscan.io/api?module=transaction&action=getstatus&txhash=#{txhash}&apikey=#{apikey}"
    headers = []
    params = []
    %{body: body} = HTTPoison.get! url , headers, params: params
    %{result: %{isError: is_error}} = Poison.decode! body, keys: :atoms
    conn
    |> render("index.html", hash: hash, is_error: is_error, result_is_present: true)
  end

  def csrf_token(conn) do
    Plug.Conn.get_session(conn, :csrf_token)
  end

end
