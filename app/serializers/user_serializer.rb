class UserSerializer
  def self.serialize(user)
    {
      id: user.id,
      name: user.name,
      birthday: user.birthday
    }
  end
end
