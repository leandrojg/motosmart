class ApplicationController < ActionController::Base
  include ActionController::Helpers
  before_action :authenticate_user

  def page
    params[:page] || 1
  end
  helper_method :page
  
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
