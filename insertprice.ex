defmodule InsertPrice do
  def init do
    File.write("price.txt", Enum.join([0, 0, 0, 0, 0], "\n"))
    price
  end

  def price do
    tmp_list = File.read!("price.txt") |> String.split
    list = Enum.map(tmp_list, fn(x) -> String.to_integer(x) end)
  end

  def update_price(coin) do
    list = price
    list2 = case coin do
      10 -> List.replace_at(list, 0, (Enum.at(list, 0) + 1))
      50 -> List.replace_at(list, 1, (Enum.at(list, 1) + 1))
      100 -> List.replace_at(list, 2, (Enum.at(list, 2) + 1))
      500 -> List.replace_at(list, 3, (Enum.at(list, 3) + 1))
      1000 -> List.replace_at(list, 4, (Enum.at(list, 4) + 1))
      _ -> list
    end

    Enum.join(list2, "\n")
    File.write("price.txt", Enum.join(list2, "\n"))

    list2
  end

  def sum_price do
    prices = price
    Enum.at(prices, 0) * 10 + Enum.at(prices, 1) * 50 + Enum.at(prices, 2) * 100 + Enum.at(prices, 3) * 500 + Enum.at(prices, 4) * 1000
  end
end
