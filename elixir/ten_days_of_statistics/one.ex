defmodule Staitstics do
  def median do
    :ok
  end

  def mean(n, values) do
    values
      |> Enum.sum
      |> Kernel./(n)
      |> Float.round(1)
  end

  def mode(n, values) do
    initial = %{}
    Enum.reduce(initial, fn val, acc ->
      case Map.get(acc, val) do
        nil ->
          Map.put(acc, val, 1)
        total ->
          Map.put(acc, val, total + 1)
      end
    end)
    |> Enum.sort(fn {k1, v1}, {k2, v2} -> v1 >= v2 end)
    |> Enum.at(0)
  end
end

Staitstics.mean(5, [1,2,3,4,5])
Staitstics.mode(5, [1, 0, 0, 2, 3])