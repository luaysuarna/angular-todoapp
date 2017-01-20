class Board < ApplicationRecord

  # Callbacks
  after_create_commit :send_notification

  # Relations
  has_many :tasks

  # Attributes
  attr_accessor :query, :user_id

  def current_user
    User.find(user_id)
  end

  def send_notification
    User.where.not(id: self.user_id).each do |user|
      ActionCable.server.broadcast("notification_#{user.id}", message: "#{current_user.email} has created board")
    end
  end

end
