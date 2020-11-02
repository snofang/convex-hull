defmodule UtilityTest do
  use ExUnit.Case
  doctest ConvexHull.Utility

  test "calculates the z value of the cross product of two vertices" do
    v1 = {0.4823896228171788, -0.4776170002088109}
    v2 = {0.4916198379282093, -0.345391701297268}
    assert ConvexHull.Utility.cross_product_z(v1, v2) == 0.06819261972144033
  end
end
