defmodule ConvexHull.Utility do
  @moduledoc false

  # Calculate a simple cross product for two dimensional vectors. Only returns the z value.
  def cross_product({x_v1, y_v1}, {x_v2, y_v2}) do
    (x_v1 * y_v2) - (x_v2 * y_v1)
  end
end
