class NotificationChannel < ApplicationCable::Channel

  def subscribed
    stream_from current_stream
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    ActionCable.server.broadcast current_stream, message: data['message']
  end

  private

    def current_stream
      "notification_#{current_user.id}"
    end
end
