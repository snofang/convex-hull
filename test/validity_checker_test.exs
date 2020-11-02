defmodule ValidityCheckerTest do
  use ExUnit.Case
  doctest ConvexHull.ValidityChecker

  test "Checks a valid set of points for validity." do
    points = [{2, 1}, {0, 3}, {11, 9}, {6, 6}, {5, 5}, {7, 1}, {8, 5}, {3, 3}, {3, 7}]

    assert ConvexHull.ValidityChecker.is_valid?(points, 2)
  end
end
