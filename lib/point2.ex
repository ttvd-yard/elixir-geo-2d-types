defmodule Geo2d.Point2 do

  @spec create() :: Geo2d.point2
  def create(), do: {0.0, 0.0}

  @spec create(float, float) :: Geo2d.point2
  def create(x, y), do: {x, y}

  @spec create(Geo2d.point2) :: Geo2d.point2
  @spec create([float]) :: Geo2d.point2
  @spec create(float) :: Geo2d.point2
  def create({x, y}), do: {x, y}
  def create(a) when is_float(a), do: {a, a}
  def create([]), do: {0.0, 0.0}
  def create([x, y|_]), do: {x, y}
  def create([x|_]), do: {x, x}

  @spec to_list(Geo2d.point2) :: [float]
  def to_list({x, y}), do: [x, y]

  @spec zero() :: Geo2d.point2
  def zero(), do: create()

  @spec x(Geo2d.point2) :: float
  def x({x, _y}), do: x

  @spec y(Geo2d.point2) :: float
  def y({_x, y}), do: y

  @spec xx(Geo2d.point2) :: Geo2d.point2
  def xx({x, _y}), do: {x, x}

  @spec yy(Geo2d.point2) :: Geo2d.point2
  def yy({_x, y}), do: {y, y}

  @spec xy(Geo2d.point2) :: Geo2d.point2
  def xy(v), do: v

  @spec yx(Geo2d.point2) :: Geo2d.point2
  def yx({x, y}), do: {y, x}

  @spec at(Geo2d.point2, integer) :: float
  def at({x, _y}, 0), do: x
  def at({_x, y}, 1), do: y

  @spec invert(Geo2d.point2) :: Geo2d.point2
  def invert({x, y}), do: {-x, -y}

  @spec rotate(Geo2d.point2, float) :: Geo2d.point2
  def rotate({x, y}, angle) do
    angle_cos = :math.cos(angle)
    angle_sin = :math.sin(angle)
    {x * angle_cos + y * angle_sin, x * angle_sin - y * angle_cos}
  end

  @spec distance_to(Geo2d.point2, Geo2d.point2) :: float
  def distance_to(v1, v2), do: :math.sqrt(distance_to_squared(v1, v2))

  @spec distance_to_squared(Geo2d.point2, Geo2d.point2) :: float
  def distance_to_squared({x1, y1}, {x2, y2}) do
    x = x1 - x2
    y = y1 - y2
    x * x + y * y
  end
  
end
