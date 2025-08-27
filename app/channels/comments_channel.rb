class CommentsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "comments"
  end

  # SvelteKit 側から perform('speak', { body: "..." }) を送る想定
  def speak(data)
    ActionCable.server.broadcast("comments", {
      body: data["body"].to_s,
      at: Time.current.to_i
    })
  end
end
