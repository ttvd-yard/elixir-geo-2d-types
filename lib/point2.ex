defmodule Geo2d.Point2 do

  @type point2 :: { float, float }

  @spec create() :: point2
  def create(), do: {0.0, 0.0}

  @spec create(float, float) :: point2
  def create(x, y), do: {x, y}

  @spec create([float]) :: point2
  @spec create(float) :: point2
  def create(a) when is_float(a), do: {a, a}
  def create([]), do: {0.0, 0.0}
  def create([x, y|_]), do: {x, y}
  def create([x|_]), do: {x, x}

  @spec zero() :: point2
  def zero(), do: create()

  @spec x(point2) :: float
  def x({x, _y}), do: x

  @spec y(point2) :: float
  def y({_x, y}), do: y

  @spec xx(point2) :: point2
  def xx({x, _y}), do: {x, x}

  @spec yy(point2) :: point2
  def yy({_x, y}), do: {y, y}

  @spec xy(point2) :: point2
  def xy(v), do: v

  @spec yx(point2) :: point2
  def yx({x, y}), do: {y, x}

  @spec at(point2, integer) :: float
  def at({x, _y}, 0), do: x
  def at({_x, y}, 1), do: y

  @spec invert(point2) :: point2
  def invert({x, y}) do
    {-x, -y}
  end

end
