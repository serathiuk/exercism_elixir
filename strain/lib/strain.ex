defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun) do
    iterate_list(list, [], fun)
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun) do
    iterate_list(list, [], &(not fun.(&1)))
  end


  defp iterate_list([], new_list, _) do
    new_list
  end

  defp iterate_list(list, new_list, fun) do
    [head | tail] = list

    if fun.(head) do
      iterate_list(tail, new_list ++ [head], fun)
    else
      iterate_list(tail, new_list, fun)
    end
  end
end
