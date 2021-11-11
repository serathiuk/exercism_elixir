defmodule Username do
  def sanitize(''), do: ''

  def sanitize([head | tail]) do
    char = case head do 
        ?ä -> 'ae'
        ?ß -> 'ss'
        ?ü  -> 'ue'
        ?ö -> 'oe'
        ?_ -> '_'
        c when c >= ?a and c <= ?z -> [c]
        _ -> ''
      end

      char ++ sanitize(tail)
  end
end
