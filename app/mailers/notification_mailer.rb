class NotificationMailer < ApplicationMailer
  helper :items

  def shortage_notification(user, item)
    @user = user
    @item = item
    mail to: user.email, subject: "Item stock shortage notification"
  end

  def issue_notification(user, issue)
    @user = user
    @issue = issue
    mail to: user.email, subject: "Solved issue notification"
  end
end
