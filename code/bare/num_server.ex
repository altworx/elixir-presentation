defmodule NumServer do
  def start() do
    spawn(fn -> loop(0) end)
  end

  defp loop(number) do
    receive do
      {:get_next, caller} ->
        next = number + 1
        send caller, next
        loop(next)
      :die ->
        IO.puts("Shut down")
    end
  end
end
