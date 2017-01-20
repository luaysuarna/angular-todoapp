class Task < ApplicationRecord

  # Callbacks
  after_create_commit :send_notification

  # Validations
  validates :name, presence: true

  # Relations
  belongs_to :board

  # Attributes
  attr_accessor :user_id

  def current_user
    User.find(user_id)
  end

  def send_notification
    User.where.not(id: self.user_id).each do |user|
      ActionCable.server.broadcast("notification_#{user.id}", message: "#{current_user.email} has created task", task: self)
    end
  end

end
