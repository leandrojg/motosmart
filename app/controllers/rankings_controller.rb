class RankingsController < ApplicationController
  def actual
    @rankings = Ranking.all.paginate(page: page, per_page: 10)
    render 'rankings/actual'
  end

  def show
    year = params[:year]
    month = params[:month]

    start_date = DateTime.new(year.to_i, month.to_i).beginning_of_month
    end_date = start_date.end_of_month

    @rankings = User.joins(:records)
                    .where(records: { created_at: start_date..end_date })
                    .group('users.id, users.name')
                    .select('users.id, users.name, SUM(records.distance) AS total_distance')
                    .order('total_distance DESC')
                    .paginate(page: page, per_page: 10)

    render 'rankings/show'
  end

  private

  def page
    params[:page] || 1
  end
  helper_method :page
end

