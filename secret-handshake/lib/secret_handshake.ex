defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  @spec process_text_command(code :: integer, signs :: list(String.t())) :: list(String.t())

  @valid_values [0, 1, 2, 4, 8, 16]

  def process_text_command(0, signs) do
    signs
  end

  def process_text_command(1, signs) do
    ["wink"] ++ signs
  end

  def process_text_command(2, signs) do
    ["double blink"] ++ signs
  end

  def process_text_command(4, signs) do
    ["close your eyes"] ++ signs
  end

  def process_text_command(8, signs) do
    ["jump"] ++ signs
  end

  def commands(code) do
    commands(code, [], false)
  end

  def commands(0, signs, true) do
    Enum.reverse(signs)
  end

  def commands(0, signs, false) do
    signs
  end

  def commands(code, signs, reverse) do
    current_command = find_max_value_command(code)

    if current_command == 16 do
      commands(code - current_command, signs, !reverse)
    else
      signs = process_text_command(current_command, signs)
      commands(code - current_command, signs, reverse)
    end
  end

  def find_max_value_command(code) do
    @valid_values
      |> Enum.filter(fn x -> x <= code end)
      |> Enum.max()
  end

end
