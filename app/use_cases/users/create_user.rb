module Users
  class CreateUser
    UserIsNotLegal = Class.new(::BaseError)
    UserIsInvalid = Class.new(::BaseError)

    def initialize
      @user_repo = UserRepository.new
    end

    def call(*args)
      data = perform(*args)

      CreateUserResult.new(data: data)
    rescue UserIsNotLegal, UserIsInvalid => e
      CreateUserResult.new(error: e)
    end

    private

    def perform(attributes)
      user = UserEntity.new(attributes)

      raise UserIsNotLegal unless user.legal?

      @user_repo.add(user)
    rescue UserRepository::InvalidAttributes
      raise UserIsInvalid
    end

    class CreateUserResult
      attr_reader :data, :error

      def initialize(data: nil, error: nil)
        @data = data
        @error = error
      end

      def success?
        !@error
      end
    end
  end
end
