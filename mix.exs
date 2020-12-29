defmodule HueSDK.MixProject do
  use Mix.Project

  def project do
    [
      app: :hue_sdk,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {HueSDK.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:finch, "~> 0.6.0"},
      # TODO: remove mint override once https://github.com/elixir-mint/mint/pull/290 is published on hex
      {:mint, github: "elixir-mint/mint", override: true},
      {:jason, "~> 1.2"},
      {:mdns, "~> 1.0"},
      {:ex_doc, "~> 0.23", only: :dev, runtime: false},
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false}
    ]
  end
end