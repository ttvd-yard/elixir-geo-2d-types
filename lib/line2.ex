defmodule Geo2d.Line2 do

  @spec create() :: Geo2d.line2
  def create(), do: {0.0, 0.0, 0.0}

  @spec create(Geo2d.line2) :: Geo2d.line2
  def create({a, b, c}), do: {a, b, c}

  @spec create(Geo2d.point2, Geo2d.point2) :: Geo2d.line2
  def create({x1, y1}, {x2, y2}), do: {y1 - y2, x2 - x1, x1 * y2 - x2 * y1}

  @spec create(float, float, float) :: Geo2d.line2
  def create(a, b, c), do: {a, b, c}

  @spec to_list(Geo2d.line2) :: [float]
  def to_list({a, b, c}), do: [a, b ,c]

end
