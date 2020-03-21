defmodule MorphicProWeb.UserSocket do
  use Phoenix.Socket

  channel "ping", MorphicProWeb.PingChannel

  def connect(_params, socket, _connect_info) do
    {:ok, socket}
  end

  def id(_socket), do: nil
  
end
