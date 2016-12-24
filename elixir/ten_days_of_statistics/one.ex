defmodule Statistics do
  def median(n, values) do
    values = Enum.sort(values)
    res = case rem(n, 2) do
      0 ->
        Float.round((Enum.at(values, div(n,2) - 1) + Enum.at(values, div(n,2))) / 2, 1)
      1 ->
        Enum.at(values, div(n,2))
    end
  end

  def mean(n, values) do
    values
      |> Enum.sum
      |> Kernel./(n)
      |> Float.round(1)
  end

  def mode(_n, values) do
    initial = %{}
    grouped = values
    |>Enum.reduce(initial, fn val, acc ->
        case Map.get(acc, val) do
          nil ->
            Map.put(acc, val, 1)
          total ->
            Map.put(acc, val, total + 1)
        end
      end)
    max = Enum.max Map.values(grouped)

    grouped
      |> Enum.filter(fn {_, v} -> v == max end)
      |> Enum.sort(fn {k1, _v1}, {k2, _v2} -> k1 <= k2 end)
      |> IO.inspect
      |> Enum.at(0)
      |> Tuple.to_list
      |> Enum.at(0)
  end
end
n = String.to_integer(String.trim(IO.read(:line)))
values = String.split(String.trim(IO.read(:line)), " ") |> Enum.map(&String.to_integer/1)

IO.puts Statistics.mean(n, values)
IO.puts Statistics.median(n, values)
IO.puts Statistics.mode(n, values)
