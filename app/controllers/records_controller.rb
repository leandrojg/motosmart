class RecordsController < ApplicationController
  def create
    user_id = params[:user_id]
    puts user_id.to_s.colorize(:blue)
    @user = User.find(params[:user_id])
    @record = @user.records.new(record_params)

    if @record.save
      render 'records/create'
    else
      render json: @record.errors, status: :unprocessable_entity
    end
  end

  private

  def record_params
    params.require(:record).permit(:distance)
  end
end
