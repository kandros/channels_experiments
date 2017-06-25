alias ChannelsExperiments.Counter

defmodule H do
  def bc(val) do
    ChannelsExperiments.Web.Endpoint.broadcast "room:counter", "counter_state", %{counter: val}
  end
end