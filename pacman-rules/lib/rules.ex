defmodule Rules do
  def eat_ghost?(power_pellet_active, touching_ghost) do
    power_pellet_active and touching_ghost
  end

  def score?(false, false), do: false
  def score?(_, _), do: true

  def lose?(power_pellet_active, touching_ghost) do
    (not power_pellet_active) and touching_ghost
  end

  def win?(true, _, false), do: true
  def win?(true, false, true), do: false
  def win?(true, true, true), do: true

end
