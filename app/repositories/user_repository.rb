class UserRepository
  InvalidAttributes = Class.new(::BaseError)

  def add(user)
    user_ar = User.create!(
      name: user.name,
      birthday: user.birthday
    )

    to_entity(user_ar)
  rescue ActiveRecord::RecordInvalid
    raise InvalidAttributes
  end

  private

  def to_entity(user_ar)
    UserEntity.new(
      id: user_ar.id,
      name: user_ar.name,
      birthday: user_ar.birthday
    )
  end
end
