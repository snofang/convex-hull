defmodule ValidityCheckerTest do
  use ExUnit.Case
  doctest ConvexHull.ValidityChecker

  test "checks a valid set of points for validity" do
    points = [{2, 1}, {0, 3}, {11, 9}, {6, 6}, {5, 5}, {7, 1}, {8, 5}, {3, 3}, {3, 7}]

    assert ConvexHull.ValidityChecker.is_valid?(points, 2)
  end

  test "checks an invalid set of points with too few points, for validity" do
    points = [{2, 1}, {0, 3}]

    assert_raise RuntimeError, "Cannot compute convex hull with less than 3 points.", fn ->
      ConvexHull.ValidityChecker.is_valid?(points)
    end
  end

  test "checks an invalid set of points with inconsistent dimensions, for validity" do
    points =  [{2, 1}, {0, 3}, {5, 5}, {7, 1}, {8, 5, 5}, {3, 3}, {3, 7}]

    assert_raise RuntimeError, "Inconsistent number of dimensions of the given points.", fn ->
      ConvexHull.ValidityChecker.is_valid?(points)
    end
  end

  test "checks an invalid set of points with too many dimensions, for validity" do
    points = [{2, 1, 9}, {0, 3, 3}, {5, 8, 2}]

    assert_raise RuntimeError, "This algorithm does not allow more than 2 dimensions.", fn ->
      ConvexHull.ValidityChecker.is_valid?(points, 2)
    end
  end
end
