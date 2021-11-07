defmodule FreelancerRates do
  def daily_rate(hourly_rate), do: hourly_rate * 8.0

  def apply_discount(before_discount, discount) do
    before_discount - (before_discount * discount / 100)
  end

  def monthly_rate(hourly_rate, discount) do
    hourly_rate
    |> to_month_without_rate()
    |> daily_rate()
    |> apply_discount(discount)
    |> Float.ceil()
    |> trunc()
  end

  defp to_month_without_rate(hourly_rate), do: hourly_rate * 22

  def days_in_budget(budget, hourly_rate, discount) do
    before_discount = daily_rate(hourly_rate)
    after_discount = apply_discount(before_discount, discount)
    Float.floor(budget / after_discount, 1)
  end
end
