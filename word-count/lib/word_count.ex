defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.replace("_", " ")
    |> String.downcase()
    |> String.split(" ")
    |> Enum.map(&(Regex.replace(~r/[^0-9a-zA-Z\-ö]+/, &1, "")))
    |> Enum.filter(&(String.length(&1) > 0))
    |> Enum.reduce(%{}, fn word, map ->
      Map.update(map, word, 1, &(&1 + 1))
    end)
  end
end
