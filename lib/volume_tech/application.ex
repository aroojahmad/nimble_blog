defmodule VolumeTech.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      VolumeTechWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: VolumeTech.PubSub},
      # Start the Endpoint (http/https)
      VolumeTechWeb.Endpoint
      # Start a worker by calling: VolumeTech.Worker.start_link(arg)
      # {VolumeTech.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: VolumeTech.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    VolumeTechWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
