defmodule VendingMachine do
  def init do
    InsertPrice.init 
    start
  end

  def start do
    menu
    input
    start
  end

  defp menu do
    IO.puts(
    """
投入金額 : #{InsertPrice.sum_price}
1 juce 100円 
2 cool 120円
3 tea  150円
4 pet  230円
お金を入れる
10
50
100
500
1000
お釣りを出す
5 change
    """
    )
  end

  defp input do
    string_input = IO.gets("入力 -> ")
    integer_input = String.split(string_input, ~r{\n}) |> List.first |> String.to_integer

    if integer_input < 10 do
      select_item(integer_input)
    else
      add_price(integer_input)
    end
  end

  defp add_price(input_integer) do
    InsertPrice.update_price(input_integer)
  end

  def select_item(input_integer) do
    
    case input_integer do
      1 -> buy("juce", 100)
      2 -> buy("cool", 120)
      3 -> buy("tea", 150)
      4 -> buy("pet", 230)
      5 -> change
      _ -> IO.puts("買えません")
    end
  end

  def buy(juce, price) do
    if is_buy(price) do
      money = InsertPrice.sum_price - price
      IO.puts("飲み物 : #{juce}")
      InsertPrice.init
      change(price)
    else
      IO.puts("買えません")
    end
  end

  def is_buy(price) do
    price < InsertPrice.sum_price
  end

  def change do
    IO.puts("お釣り：#{InsertPrice.sum_price}")
  end

  def change(price) do
    IO.puts("お釣り：#{price}")
  end
end
