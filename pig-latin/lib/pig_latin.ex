defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """

  @vowels ["a", "e", "i", "o", "u"]
  @consonant_like ["ch", "qu", "squ", "th", "thr", "sch"]

  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |> String.split(" ")
    |> Enum.map(&(check_phrase(&1)))
    |> Enum.join(" ")
  end

  def check_phrase(phrase) do
    phrase
    |> check_vowels()
    |> check_consonant()
  end

  defp check_vowels(phrase) do
    first_char = find_first_char(phrase)

    if first_char in @vowels do
      phrase <> "ay"
    else
      phrase
    end
  end

  defp check_consonant(phrase) do
    first_char = find_first_char(phrase)

    if first_char not in @vowels do
      {inicio, fim} = find_consonants(phrase, [])
      fim <> inicio <> "ay"
    else
      phrase
    end
  end

  defp find_consonants(phrase, chars) do
    [head | tail] = String.graphemes(phrase)

    possible_start = to_string(chars) <> head

    cond do
      (to_string(chars) in ["x", "y"]) and (head not in @vowels) -> {"", to_string(chars) <> phrase}
      head not in @vowels -> find_consonants(to_string(tail), chars ++ [head])
      possible_start in @consonant_like -> {possible_start, to_string(tail)}
      true -> {to_string(chars), phrase}
    end
  end

  defp find_first_char(phrase) do
    String.downcase(String.first(phrase))
  end

end
