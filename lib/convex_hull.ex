defmodule ConvexHull do
  @moduledoc """
  Module providing functions for computing a convex hull from a list of points. Each point should be a tuple with as many elements as dimensions.
  Each available convex hull algorithm specifies how many dimensions are supported and the running time in asymptotic notation.
  """
  def gift_wrapping(points) do
    ConvexHull.GiftWrapping.gift_wrapping(points)
  end

  def graham_scan(points) do
    ConvexHull.GrahamScan.graham_scan(points)
  end
end
