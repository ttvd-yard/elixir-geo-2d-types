defmodule Geo2d.Point2 do

  @type point2 :: { float, float }

  @spec create() :: point2
  def create(), do: {0.0, 0.0}

  @spec create(float, float) :: point2
  def create(x, y), do: {x, y}

  @spec create([float]) :: point2
  @spec create(float) :: point2
  def create(a) when is_float(a), do: {a, a}
  def create(a) when is_list(a) do
    [x, y | _] = a
    {x, y}
  end

  @spec zero() :: point2
  def zero(), do: create()

  @spec x(point2) :: float
  def x(p), do: elem(p, 0)

  @spec y(point2) :: float
  def y(p), do: elem(p, 1)

end
