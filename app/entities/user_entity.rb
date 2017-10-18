class UserEntity
  include Virtus.model

  MIN_LEGAL_AGE = 21

  attribute :id, Integer
  attribute :name, String
  attribute :birthday, DateTime

  def legal?
    birthday && ((DateTime.now.year - birthday.year) >= MIN_LEGAL_AGE)
  end
end
