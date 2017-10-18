class UsersController < ApplicationController
  def create
    create_user = Users::CreateUser.new

    result = create_user.call(params.fetch(:user).permit(:name, :birthday))

    if result.success?
      render json: { user: UserSerializer.serialize(result.data) }, status: :created
    else
      render json: { error: ErrorSerializer.serialize(result.error) }, status: :unprocessable_entity
    end
  end
end
