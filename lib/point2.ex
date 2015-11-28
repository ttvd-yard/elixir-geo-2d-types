defmodule Geo2DTypes.Point2 do

  @type point2 :: { float, float }

  @spec create() :: point2
  def create(), do: {0.0, 0.0}

  @spec create(float, float) :: point2
  def create(x, y), do: {x, y}

  @spec create([float]) :: point2
  def create(v) do
    [x, y | _] = v
    {x, y}
  end
end
