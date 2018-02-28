defmodule NumServer do
  use GenServer

  # App interface

  def start_link(args \\ nil) do
    GenServer.start_link(__MODULE__, args, name: __MODULE__)
  end

  def get_next, do: GenServer.call(__MODULE__, :get_next)

  def reset, do: GenServer.cast(__MODULE__, :reset)

  def crash, do: GenServer.cast(__MODULE__, :crash)

  # Callbacks

  def init(_) do
    {:ok, 0}
  end

  def handle_call(:get_next, _from, num) do
    new_state = num + 1
    {:reply, new_state, new_state}
  end

  def handle_cast(:crash, _) do
    1 / 0
  end

  def handle_cast(:reset, _) do
    {:noreply, 0}
  end

end

