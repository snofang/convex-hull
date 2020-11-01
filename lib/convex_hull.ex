defmodule ConvexHull do
  @moduledoc """
  Module providing functions for computing a convex hull from a list of points. Each point should be a tuple with as many elements as dimensions.
  Each available convex hull algorithm specifies how many dimensions are supported and the running time in asymptotic notation.
  """
  @doc """
  Simple but not the most efficient algorithm, also known as Jarvis' march.

  Created independently by Chand & Kapur in 1970 and R. A. Jarvis in 1973. The algorithm has a time complixity of O(nh),
  where n is the number of points and h is the number of points on the convex hull. This algorithm can be used when n is
  small or when h is expected to be very small with respect to n. The algorithm only supports two-dimensional points.
  """
  def gift_wrapping(points) do
    ConvexHull.GiftWrapping.gift_wrapping(points)
  end

  def graham_scan(points) do
    ConvexHull.GrahamScan.graham_scan(points)
  end
end
