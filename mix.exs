defmodule ConvexHull.MixProject do
  use Mix.Project

  def project do
    [
      app: :convex_hull,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      # applications: applications(Mix.env()),
      extra_applications: [:logger]
    ]
  end

  # defp applications(:dev), do: applications(:all) ++ [:remix]
  # defp applications(_all), do: [:logger]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:remix, "~> 0.0.1", only: :dev}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
