defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add({a1, b1}, {a2, b2}) do
    {((a1 * b2) + (a2 * b1)), (b1 * b2)}
    |> reduce()
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract({a1, b1}, {a2, b2}) do
    {((a1 * b2) - (a2 * b1)), (b1 * b2)}
    |> reduce()
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({a1, b1}, {a2, b2}) do
    {(a1 * a2), (b1 * b2)}
    |> reduce()
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by({a1, b1}, {a2, b2}) do
    {(a1 * b2), (a2 * b1)}
    |> reduce()
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({a, b}) do
    {abs_number(a), abs_number(b)}
    |> reduce()
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational({a, b}, n) when n < 0 do
    pow_rational({b, a}, n * -1)
  end

  def pow_rational({a, b}, n) do
    {Integer.pow(a, n), Integer.pow(b, n)}
    |> reduce()
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, {a, b}) do
    Float.pow(x * 1.0, a / b)
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce({a, b}) when b < 0 do
    {a * -1, b * -1}
    |> reduce()
  end

  def reduce({a, b}) do
    gcd = Integer.gcd(a, b)
    {a / gcd, b / gcd}
  end

  defp abs_number(number) when number < 0 do
    number * -1
  end

  defp abs_number(number) do
    number
  end

end
