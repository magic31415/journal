defmodule JournalWeb.CodeChannel do
  use JournalWeb, :channel

  def join("journal:code", payload, socket) do
    if authorized?(payload) do
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  def handle_in("code", payload, socket) do
    code = :rand.uniform * 10000
           |> Kernel.trunc()
           |> Integer.to_string()
           |> String.pad_leading(4, "0")
    # sms_message = %Textex.SmsMessage {
    #   phone_number: "5163535462", # must be 10 digits
    #   message: :rand.uniform * 10000
    #            |> Kernel.trunc()
    #            |> Integer.to_string()
    #            |> String.pad_leading(4, "0")
    # }

    # Textex.SmsMessage.send!(sms_message)
    Application.put_env(:journal, :code, code)
    IO.puts "---------- code: #{code} ------------"
    {:noreply, socket}
  end

  # # Channels can be used in a request/response fashion
  # # by sending replies to requests from the client
  # def handle_in("ping", payload, socket) do
  #   {:reply, {:ok, payload}, socket}
  # end

  # def handle_in("message", payload, socket) do
  #   broadcast! socket, "message", payload
  #   {:noreply, socket}
  # end

  # def handle_in("message", %{"user_id" => user_id, "content" => content}, socket) do
  #   broadcast! socket, "message", %{user_id: user_id, content: content}
  #   {:noreply, socket}
  # end

  # # It is also common to receive messages from the client and
  # # broadcast to everyone in the current topic (updates:lobby).
  # def handle_in("shout", payload, socket) do
  #   broadcast socket, "shout", payload
  #   {:noreply, socket}
  # end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
