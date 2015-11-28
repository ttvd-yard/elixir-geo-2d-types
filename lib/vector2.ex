defmodule Geo2DTypes.Vector2 do

  @type vector2 :: { float, float }

  @spec create() :: vector2
  def create(), do: {0.0, 0.0}

  @spec create(float, float) :: vector2
  def create(x, y), do: {x, y}

  @spec create([float]) :: vector2
  def create(v) do
    [x, y | _] = v
    {x, y}
  end

  @spec zero() :: vector2
  def zero(), do: create()

  @spec identity() :: vector2
  def identity(), do: {1.0, 1.0}

  @spec x(vector2) :: float
  def x(p), do: elem(p, 0)

  @spec y(vector2) :: float
  def y(p), do: elem(p, 1)

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

  @spec dot(vector2, vector2) :: float
  def dot(v1, v2) do
    {x1, y1} = v1
    {x2, y2} = v2
    x1 * x2 + y1 * y2
  end

  @spec normalize(vector2) :: vector2
  def normalize(v) do
    {x, y} = v
    inv_len = 1.0 / magnitude(v)
    {x * inv_len, y * inv_len}
  end


end
