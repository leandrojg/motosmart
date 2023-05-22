class ApplicationController < ActionController::Base
  before_action :authenticate_user

  private

  def authenticate_user
    uuid = request.headers['UUID']
    token = request.headers['Token']
    
    user = User.find_by(id: uuid, token: token)
    
    if user.nil?
      render json: { error: 'Autenticación fallida' }, status: :unauthorized
    end
  end
end
