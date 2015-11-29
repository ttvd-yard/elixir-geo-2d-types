defmodule Geo2d.Line2 do

  import Geo2d.Constants

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

  @spec dx(Geo2d.line2) :: float
  def dx({_a, b, _c}), do: b

  @spec dy(Geo2d.line2) :: float
  def dy({a, _b, _c}), do: -a

  @spec slope(Geo2d.line2) :: float
  def slope(l) do
    d_x = dx(l)

    if d_x == 0.0 do
      inf
    end

    dy(l) / d_x
  end

  @spec is_vertical(Geo2d.line2) :: boolean
  def is_vertical(l), do: slope(l) == inf

  @spec is_horizontal(Geo2d.line2) :: boolean
  def is_horizontal(l), do: slope(l) == 0.0

  @spec is_parallel_to(Geo2d.line2, Geo2d.line2) :: boolean
  def is_parallel_to(l1, l2), do: slope(l1) == slope(l2)

end
