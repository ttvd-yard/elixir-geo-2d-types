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

    if zero?(d_x) do
      inf
    end

    dy(l) / d_x
  end

  @spec vertical?(Geo2d.line2) :: boolean
  def vertical?(l), do: slope(l) |> inf?

  @spec horizontal?(Geo2d.line2) :: boolean
  def horizontal?(l), do: slope(l) |> zero?

  @spec parallel?(Geo2d.line2, Geo2d.line2) :: boolean
  def parallel?(l1, l2), do: equal?(slope(l1), slope(l2))

  @spec intersecting?(Geo2d.line2, Geo2d.line2) :: boolean
  def intersecting?(l1, l2), do: not parallel?(l1, l2)

  @spec contains_point(Geo2d.line2, Geo2d.point2) :: boolean
  def contains_point({a, b, c}, {x, y}), do: zero?(x * a + y * b + c)

end
