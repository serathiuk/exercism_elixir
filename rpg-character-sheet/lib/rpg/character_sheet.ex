defmodule RPG.CharacterSheet do

  def welcome() do
    IO.puts("Welcome! Let's fill out your character sheet together.")
  end

  def ask_name() do
    IO.gets("What is your character's name?\n")
    |> clean_string()
  end

  def ask_class() do
    String.trim(IO.gets("What is your character's class?\n"))
    |> clean_string()
  end

  def ask_level() do
    IO.gets("What is your character's level?\n")
    |> to_integer()
  end

  def run() do
    welcome()
    IO.inspect %{name: ask_name(), class: ask_class(), level: ask_level()}, label: "Your character"
  end

  defp to_integer(string) do
    if String.match?(string, ~r/[0-9]+/) do
      string
      |> clean_string()
      |> String.to_integer()
    else
      ""
    end
  end

  defp clean_string(string) do
    string
    |> String.trim()
  end

end
