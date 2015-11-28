defmodule Geo2d.Vector2 do

  import Geo2d.Constants

  @type vector2 :: { float, float }

  @spec create() :: vector2
  def create(), do: {0.0, 0.0}

  @spec create(float, float) :: vector2
  def create(x, y), do: {x, y}

  @spec create([float]) :: vector2
  @spec create(float) :: vector2
  def create(a) when is_float(a), do: {a, a}
  def create(a) when is_list(a) do
    [x, y | _] = a
    {x, y}
  end

  @spec zero() :: vector2
  def zero(), do: create()

  @spec identity() :: vector2
  def identity(), do: {1.0, 1.0}

  @spec x(vector2) :: float
  def x(v), do: elem(v, 0)

  @spec y(vector2) :: float
  def y(v), do: elem(v, 1)

  @spec xx(vector2) :: vector2
  def xx(v) do
    {x, _y} = v
    {x, x}
  end

  @spec yy(vector2) :: vector2
  def yy(v) do
    {_x, y} = v
    {y, y}
  end

  @spec xy(vector2) :: vector2
  def xy(v), do: v

  @spec yx(vector2) :: vector2
  def yx(v) do
    {x, y} = v
    {y, x}
  end

  @spec magnitude_squared(vector2) :: float
  def magnitude_squared(v) do
    {x, y} = v
    x * x + y * y
  end

  @spec magnitude(vector2) :: float
  def magnitude(v), do: :math.sqrt(magnitude_squared(v))

  @spec add(vector2, vector2) :: vector2
  def add(v1, v2) do
    {x1, y1} = v1
    {x2, y2} = v2
    {x1 + x2, y1 + y2}
  end

  @spec sub(vector2, vector2) :: vector2
  def sub(v1, v2) do
    {x1, y1} = v1
    {x2, y2} = v2
    {x1 - x2, y1 - y2}
  end

  @spec scale(vector2, float) :: vector2
  def scale(v, s) do
    {x, y} = v
    {x * s, y * s}
  end

  @spec is_zero(vector2) :: boolean
  def is_zero({0.0, 0.0}), do: true
  def is_zero(_v), do: false

  @spec is_identity(vector2) :: boolean
  def is_identity({1.0, 1.0}), do: true
  def is_identity(_v), do: false

  @spec is_almost_zero(vector2) :: boolean
  def is_almost_zero(v) do
    {x, y} = v

    if :math.abs(x) < epsilon and :math.abs(y) < epsilon do
      true
    end

    false
  end

  @spec dot(vector2, vector2) :: float
  def dot(v1, v2) do
    {x1, y1} = v1
    {x2, y2} = v2
    x1 * x2 + y1 * y2
  end

  @spec normalize(vector2) :: vector2
  def normalize({0.0, 0.0}) do
   raise ArithmeticError, message: "Zero vector normalization"
  end

  @spec normalize(vector2) :: vector2
  def normalize(v) do
    {x, y} = v
    inv_len = 1.0 / magnitude(v)
    {x * inv_len, y * inv_len}
  end

  @spec invert(vector2) :: vector2
  def invert(v) do
    {x, y} = v
    {-x, -y}
  end
end
