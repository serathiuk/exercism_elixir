defmodule BirdCount do
  def today([]), do: nil

  def today([today | _ ]), do: today

  def increment_day_count([]), do: [1]

  def increment_day_count([today | next_days ]), do: [today + 1 | next_days]

  def has_day_without_birds?(list) do
    has_day_without_birds?(list, 0)
  end

  defp has_day_without_birds?([], count), do: count > 0
  
  defp has_day_without_birds?([today | next_days], count) do
    if today == 0 do
      has_day_without_birds?(next_days, count + 1)
    else
      has_day_without_birds?(next_days, count)
    end
  end

  def total(list) do
    total(list, 0)
  end

  defp total([], total_sum), do: total_sum

  defp total([today | next_days], total_sum) do
    total_sum = total_sum + today
    total(next_days, total_sum)
  end

  def busy_days(all_days) do
    busy_days(all_days, 0)
  end

  defp busy_days([], busy_days_count), do: busy_days_count

  defp busy_days([today | next_days ], busy_days_count) do
    if today >= 5 do
      busy_days(next_days, busy_days_count + 1)
    else 
      busy_days(next_days, busy_days_count)
    end
  end

end
