defmodule Geo2d.Vector2 do

  @spec create() :: Geo2d.vector2
  def create(), do: {0.0, 0.0}

  @spec create(Geo2d.point2, Geo2d.point2) :: Geo2d.vector2
  @spec create(float, float) :: Geo2d.vector2
  def create({x1, y1}, {x2, y2}), do: {x2 - x1, y2 - y1}
  def create(x, y), do: {x, y}

  @spec create(Geo2d.vector2) :: Geo2d.vector2
  @spec create([float]) :: Geo2d.vector2
  @spec create(float) :: Geo2d.vector2
  def create({x, y}), do: {x, y}
  def create(a) when is_float(a), do: {a, a}
  def create([]), do: {0.0, 0.0}
  def create([x, y|_]), do: {x, y}
  def create([x|_]), do: {x, x}

  @spec equal?(Geo2d.vector2, Geo2d.vector2) :: boolean
  def equal?({x1, y1}, {x2, y2}), do: equal?(x1, x2) and equal?(y1, y2)

  @spec to_list(Geo2d.vector2) :: [float]
  def to_list({x, y}), do: [x, y]

  @spec zero() :: Geo2d.vector2
  def zero(), do: create()

  @spec identity() :: Geo2d.vector2
  def identity(), do: {1.0, 1.0}

  @spec x(Geo2d.vector2) :: float
  def x({x, _y}), do: x

  @spec y(Geo2d.vector2) :: float
  def y({_x, y}), do: y

  @spec at(Geo2d.vector2, integer) :: float
  def at({x, _y}, 0), do: x
  def at({_x, y}, 1), do: y

  @spec magnitude_squared(Geo2d.vector2) :: float
  def magnitude_squared({x, y}), do: x * x + y * y

  @spec magnitude(Geo2d.vector2) :: float
  def magnitude(v), do: :math.sqrt(magnitude_squared(v))

  @spec add(Geo2d.vector2, Geo2d.vector2) :: Geo2d.vector2
  def add({x1, y1}, {x2, y2}), do: {x1 + x2, y1 + y2}

  @spec sub(Geo2d.vector2, Geo2d.vector2) :: Geo2d.vector2
  def sub({x1, y1}, {x2, y2}), do: {x1 - x2, y1 - y2}

  @spec scale(Geo2d.vector2, float) :: Geo2d.vector2
  def scale({x, y}, s), do: {x * s, y * s}

  @spec zero?(Geo2d.vector2) :: boolean
  def zero?({0.0, 0.0}), do: true
  def zero?(_v), do: false

  @spec identity?(Geo2d.vector2) :: boolean
  def identity?({1.0, 1.0}), do: true
  def identity?(_v), do: false

  @spec almost_zero?(Geo2d.vector2) :: boolean
  def almost_zero?({x, y}), do: Geo2d.Utils.is_zero(x) and Geo2d.Utils.is_zero(y)

  @spec dot(Geo2d.vector2, Geo2d.vector2) :: float
  def dot({x1, y1}, {x2, y2}), do: x1 * x2 + y1 * y2

  @spec cross(Geo2d.vector2, Geo2d.vector2) :: float
  def cross({x1, y1}, {x2, y2}), do: x1 * y2 - y1 * x2

  @spec normalize(Geo2d.vector2) :: Geo2d.vector2
  def normalize({0.0, 0.0}) do
   raise ArithmeticError, message: "Zero vector normalization"
  end

  @spec normalize(Geo2d.vector2) :: Geo2d.vector2
  def normalize({x, y} = v) do
    inv_len = 1.0 / magnitude(v)
    {x * inv_len, y * inv_len}
  end

  @spec invert(Geo2d.vector2) :: Geo2d.vector2
  def invert({x, y}), do: {-x, -y}

  @spec project(Geo2d.vector2, Geo2d.vector2) :: Geo2d.vector2
  def project({_x, _y}, {0.0, 0.0}) do
    raise ArithmeticError, message: "Projection on zero vector"
  end
  def project(v1, {x2, y2} = v2) do
    term = dot(v1, v2) / magnitude_squared(v2)
    {x2 * term, y2 * term}
  end

end
