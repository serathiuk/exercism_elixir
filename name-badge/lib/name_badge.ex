defmodule NameBadge do
  def print(id, name, department) do
    name_badge_list = if id, do: ["[#{id}]"], else: []

    name_badge_list = name_badge_list ++ [name]

    name_badge_list = if department do
        name_badge_list ++ [String.upcase(department)]
      else 
        name_badge_list ++ ["OWNER"]
      end

    name_badge_list
    |> Enum.join(" - ")
  end
end
