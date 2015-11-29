defmodule Geo2d.Line2 do

  import Geo2d.Utils
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

    if is_zero(d_x) do
      inf
    end

    dy(l) / d_x
  end

  @spec is_vertical(Geo2d.line2) :: boolean
  def is_vertical(l), do: slope(l) |> is_inf

  @spec is_horizontal(Geo2d.line2) :: boolean
  def is_horizontal(l), do: slope(l) |> is_zero

  @spec are_parallel(Geo2d.line2, Geo2d.line2) :: boolean
  def are_parallel(l1, l2), do: are_equal(slope(l1), slope(l2))

  @spec are_intersecting(Geo2d.line2, Geo2d.line2) :: boolean
  def are_intersecting(l1, l2), do: not are_parallel(l1, l2)

  @spec contains_point(Geo2d.line2, Geo2d.point2) :: boolean
  def contains_point({a, b, c}, {x, y}), do: is_zero(x * a + y * b + c)

end
