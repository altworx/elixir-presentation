defmodule NumSupervisor do
  use Supervisor

  def start_link(arg \\ nil) do
    Supervisor.start_link(__MODULE__, arg, name: __MODULE__)
  end

  def init(_arg) do
    children = [NumServer]
    Supervisor.init(children, strategy: :one_for_one)
  end
end
