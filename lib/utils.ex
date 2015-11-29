defmodule Geo2d.Utils do

  import Geo2d.Constants

  @spec equal?(float, float) :: boolean
  def equal?(f1, f2), do: :math.abs(f1 - f2) < epsilon

  @spec zero?(float) :: boolean
  def zero?(f), do: :math.abs(f) < epsilon

  @spec inf?(float) :: boolean
  def inf?(f), do: :math.abs(f) == inf

end
