module UsersHelper
  def avatar(avatar)
    avatar.present? ? avatar : asset_url("avatar_default.jpeg")
  end
end
