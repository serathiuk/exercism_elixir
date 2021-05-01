defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase()
    |> String.replace("_", " ")
    |> String.split(" ", trim: true)
    |> Enum.map(&(Regex.replace(~r/[^[:alnum:]-]/u, &1, "")))
    |> Enum.filter(&(String.length(&1) > 0))
    |> Enum.reduce(%{}, fn word, map ->
      Map.update(map, word, 1, &(&1 + 1))
    end)
  end
end
