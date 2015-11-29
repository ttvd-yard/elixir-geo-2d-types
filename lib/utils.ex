defmodule Geo2d.Utils do

  import Geo2d.Constants

  @spec are_equal(float, float) :: boolean
  def are_equal(f1, f2), do: :math.abs(f1 - f2) < epsilon

  @spec is_zero(float) :: boolean
  def is_zero(f), do: :math.abs(f) < epsilon

  @spec inf?(float) :: boolean
  def inf?(f), do: :math.abs(f) == inf

end
