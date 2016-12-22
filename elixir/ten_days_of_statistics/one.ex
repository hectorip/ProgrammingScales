defmodule Staitstics do
  def median do
    :ok
  end

  def mean(n, values) do
    values
      |> Enum.sum
      |> &(&1/n)
  end

  def mode do
    :ok
  end
end

Staitstics(5, [1,2,3,4,5])