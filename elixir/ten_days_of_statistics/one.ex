defmodule Statistics do
  def median do
    :ok
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
      |> Enum.sort(fn {_k1, v1}, {_k2, v2} -> v1 >= v2 end)
      |> Enum.at(0)
      |> Tuple.to_list
      |> Enum.at(0)
  end
end

Statistics.mean(5, [1,2,3,4,5])
Statistics.mode(5, [1, 0, 0, 2, 3])