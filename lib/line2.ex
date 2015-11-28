defmodule Geo2d.Line2 do

  @spec create() :: Geo2d.line2
  def create(), do: {0.0, 0.0, 0.0}

  @spec create(Geo2d.point2, Geo2d.point2) :: Geo2d.line2
  def create(_p1, _p2) do
    {0.0, 0.0, 0.0}
  end

  @spec create(float, float, float) :: Geo2d.line2
  def create(a, b, c), do: {a, b, c}

end
