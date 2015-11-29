defmodule Geo2d.Util do

  import Geo2d.Constants

  @spec are_equal(float, float) :: boolean
  def are_equal(f1, f2), do: :math.abs(f1 - f2) < epsilon

  @spec is_zero(float) :: boolean
  def is_zero(f), do: :math.abs(f) < epsilon

  @spec is_inf(float) :: boolean
  def is_inf(f), do: :math.abs(f) == inf

end
