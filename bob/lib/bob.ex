defmodule Bob do
  
  @spec hey(String.t()) :: String.t()
  def hey(input) do
    input = String.trim(input)

    cond do
      silence?(input) ->
        "Fine. Be that way!"
      yelling?(input) and questioning?(input) ->
        "Calm down, I know what I'm doing!"
      yelling?(input) ->
        "Whoa, chill out!"
      questioning?(input) ->
        "Sure."
      true ->
        "Whatever."
    end
  end

  defp yelling?(input) do
    String.upcase(input) == input and String.downcase(input) != input
  end

  defp questioning?(input) do 
    String.slice(input, -1, 1) == "?"
  end

  defp silence?(input) do
    String.length(input) == 0
  end

end
