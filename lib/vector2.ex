defmodule Geo2d.Vector2 do

  import Geo2d.Constants

  @type vector2 :: {float, float}

  @spec create() :: vector2
  def create(), do: {0.0, 0.0}

  @spec create(float, float) :: vector2
  def create(x, y), do: {x, y}

  @spec create(vector2) :: vector2
  @spec create([float]) :: vector2
  @spec create(float) :: vector2
  def create({x, y}), do: {x, y}
  def create(a) when is_float(a), do: {a, a}
  def create([]), do: {0.0, 0.0}
  def create([x, y|_]), do: {x, y}
  def create([x|_]), do: {x, x}

  @spec to_list(vector2) :: [float]
  def to_list({x, y}), do: [x, y]

  @spec zero() :: vector2
  def zero(), do: create()

  @spec identity() :: vector2
  def identity(), do: {1.0, 1.0}

  @spec x(vector2) :: float
  def x({x, _y}), do: x

  @spec y(vector2) :: float
  def y({_x, y}), do: y

  @spec xx(vector2) :: vector2
  def xx({x, _y}), do: {x, x}

  @spec yy(vector2) :: vector2
  def yy({_x, y}), do: {y, y}

  @spec xy(vector2) :: vector2
  def xy(v), do: v

  @spec yx(vector2) :: vector2
  def yx({x, y}), do: {y, x}

  @spec at(vector2, integer) :: float
  def at({x, _y}, 0), do: x
  def at({_x, y}, 1), do: y

  @spec magnitude_squared(vector2) :: float
  def magnitude_squared({x, y}), do: x * x + y * y

  @spec magnitude(vector2) :: float
  def magnitude(v), do: :math.sqrt(magnitude_squared(v))

  @spec add(vector2, vector2) :: vector2
  def add({x1, y1}, {x2, y2}), do: {x1 + x2, y1 + y2}

  @spec sub(vector2, vector2) :: vector2
  def sub({x1, y1}, {x2, y2}), do: {x1 - x2, y1 - y2}

  @spec scale(vector2, float) :: vector2
  def scale({x, y}, s), do: {x * s, y * s}

  @spec is_zero(vector2) :: boolean
  def is_zero({0.0, 0.0}), do: true
  def is_zero(_v), do: false

  @spec is_identity(vector2) :: boolean
  def is_identity({1.0, 1.0}), do: true
  def is_identity(_v), do: false

  @spec is_almost_zero(vector2) :: boolean
  def is_almost_zero({x, y}) do

    if :math.abs(x) < epsilon and :math.abs(y) < epsilon do
      true
    end

    false
  end

  @spec dot(vector2, vector2) :: float
  def dot({x1, y1}, {x2, y2}), do: x1 * x2 + y1 * y2

  @spec cross(vector2, vector2) :: float
  def cross({x1, y1}, {x2, y2}), do: x1 * y2 - y1 * x2

  @spec normalize(vector2) :: vector2
  def normalize({0.0, 0.0}) do
   raise ArithmeticError, message: "Zero vector normalization"
  end

  @spec normalize(vector2) :: vector2
  def normalize({x, y} = v) do
    inv_len = 1.0 / magnitude(v)
    {x * inv_len, y * inv_len}
  end

  @spec invert(vector2) :: vector2
  def invert({x, y}), do: {-x, -y}

  @spec project(vector2, vector2) :: vector2
  def project({_x, _y}, {0.0, 0.0}) do
    raise ArithmeticError, message: "Projection on zero vector"
  end
  def project(v1, {x2, y2} = v2) do
    term = dot(v1, v2) / magnitude_squared(v2)
    {x2 * term, y2 * term}
  end

end
