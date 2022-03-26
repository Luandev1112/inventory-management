# Preview all emails at http://localhost:3000/rails/mailers/notification_mailer
class NotificationMailerPreview < ActionMailer::Preview
  def shortage_notification
    NotificationMailer.shortage_notification(User.first)
  end
end
