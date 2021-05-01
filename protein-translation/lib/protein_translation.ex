defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) do
    rna
    |> to_charlist()
    |> Enum.chunk_every(3)
    |> Enum.map(&(to_string(&1)))
    |> Enum.map(&(of_codon(&1)))
    |> Enum.reduce_while({:ok, []}, fn
      {:ok, "STOP"}, {:ok, wordlist} -> {:cont, {:ok, wordlist}}
      {:ok, word}, {:ok, wordlist} -> process_protein(wordlist, word)
      _, { :error, _ } -> {:halt, {:error, "invalid RNA"}}
      {:error, _ }, _ -> {:halt, {:error, "invalid RNA"}}
    end)
  end

  defp process_protein(wordlist, word) do
    if not Enum.member?(wordlist, word) do
      {:cont, {:ok, wordlist ++ [word]}}
    else
      {:halt, {:ok, wordlist}}
    end
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: {atom, String.t()}
  def of_codon(codon) do
    rnas = %{
      "UGU" => "Cysteine",
      "UGC" => "Cysteine",
      "UUA" => "Leucine",
      "UUG" => "Leucine",
      "AUG" => "Methionine",
      "UUU" => "Phenylalanine",
      "UUC" => "Phenylalanine",
      "UCU" => "Serine",
      "UCC" => "Serine",
      "UCA" => "Serine",
      "UCG" => "Serine",
      "UGG" => "Tryptophan",
      "UAU" => "Tyrosine",
      "UAC" => "Tyrosine",
      "UAA" => "STOP",
      "UAG" => "STOP",
      "UGA" => "STOP"
    }


    if rnas[codon] != nil do
      {:ok, rnas[codon]}
    else
      {:error, "invalid codon"}
    end
  end
end
