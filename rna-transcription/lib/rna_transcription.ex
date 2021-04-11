defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    letters = %{?G => ?C, ?C => ?G, ?T => ?A, ?A => ?T}
    Enum.map(dna, fn v -> letters[v] end)
  end
end
