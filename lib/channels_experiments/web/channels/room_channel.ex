defmodule ChannelsExperiments.Web.RoomChannel do
  use Phoenix.Channel

  def join("room:lobby", _message, socket) do
    {:ok, socket}
  end

  def join("room:counter", _params, socket) do
    case Process.whereis ChannelsExperiments.Counter do
       nil -> ChannelsExperiments.Counter.start_link()
       pid -> pid
    end

    send(self, :after_join)
    {:ok, socket}
  end

  def join("room:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end

   def handle_info(:after_join, socket) do
        push socket, "counter_state", %{counter: ChannelsExperiments.Counter.get()}
        {:noreply, socket}
   end

  def handle_in("new_msg", payload, socket) do
    broadcast! socket, "new_msg", payload
    {:noreply, socket}
  end

  def handle_in("increment", payload, socket) do
    broadcast! socket, "counter_state", %{counter: ChannelsExperiments.Counter.increment()}
    {:noreply, socket}
  end

  def handle_in("decrement", payload, socket) do
    broadcast! socket, "counter_state", %{counter: ChannelsExperiments.Counter.decrement()}
    {:noreply, socket}
  end

end