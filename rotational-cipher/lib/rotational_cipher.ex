defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> String.to_charlist()
    |> Enum.map(&(rotate_char(&1, shift)))
    |> to_string()
  end

  defp rotate_char(char, shift) do
    cond do
      char in ?A..?Z -> rotate_char(char, shift, ?A, ?Z)
      char in ?a..?z -> rotate_char(char, shift, ?a, ?z)
      true  -> char
    end
  end

  defp rotate_char(char, shift, initial_char, final_char) do
    diff = char + shift - final_char
    if diff > 0 do
      initial_char + diff - 1
    else
      char + shift
    end
  end
end
