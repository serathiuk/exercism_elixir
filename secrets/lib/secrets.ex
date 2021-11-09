defmodule Secrets do
  def secret_add(secret) do
    fn v -> v + secret end
  end

  def secret_subtract(secret) do
    fn v -> v - secret end
  end

  def secret_multiply(secret) do
    fn v -> v * secret end
  end

  def secret_divide(secret) do
    fn v -> trunc(v / secret) end
  end

  def secret_and(secret) do
    fn v -> Bitwise.&&&(secret, v) end
  end

  def secret_xor(secret) do
    fn v -> Bitwise.^^^(secret, v) end
  end

  def secret_combine(secret_function1, secret_function2) do
    fn v ->  
      secret_function2.(secret_function1.(v))
    end
  end
end
