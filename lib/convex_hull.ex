defmodule ConvexHull do
  @moduledoc """
  Module providing functions for computing a convex hull from a list of points. Each point should be a tuple with as many elements as dimensions.
  Each available convex hull algorithm specifies how many dimensions are supported and the running time in asymptotic notation.
  """

  @doc """
  Gift wrapping has a time complixity of O(nh), where n is the number of points and h is the number of points on the convex hull.

  Simple but not the most efficient algorithm, also known as Jarvis' march. Created independently by Chand & Kapur in
  1970 and R. A. Jarvis in 1973. This algorithm can be used when n is small or when h is expected to be very small with
  respect to n. The algorithm only supports two-dimensional points.
  """
  def gift_wrapping(points) do
    ConvexHull.GiftWrapping.gift_wrapping(points)
  end

  @doc """
  Graham scan has a time complexity of O(n log n), where n is the number of points.

  Slighty more sophisticated, but much more efficient than the gift wrapping algorithm. Named after Ronald Graham,
  who published the algorithm in 1972. The algorithm only supports two-dimensional points.
  """
  def graham_scan(points) do
    ConvexHull.GrahamScan.graham_scan(points)
  end

  def chans_algorithm(points) do
    ConvexHull.ChansAlgorithm.chans_algorithm(points)
  end
end
