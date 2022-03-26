module UsersHelper
  def get_user_name_by_id(id)
    user = User.find(id)
    return "N/A" if user.nil?
    user.name
  end
end
