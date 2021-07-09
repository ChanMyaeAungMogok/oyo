class ScoresController < ApplicationController
  skip_before_action :verify_authenticity_token
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_response
  rescue_from ActiveRecord::RecordNotDestroyed, with: :not_destroyed_response
  rescue_from ActiveRecord::RecordNotSaved , with: :not_saved_response

  def not_found_response
    render json: { message: 'Score not found.' }, status: :not_found
  end

  def not_destroyed_response
    render json: { message: 'Score not deleted.' }, status: :unprocessable_entity
  end

  def not_saved_response
    render json: { message: 'Score not saved.' }, status: :unprocessable_entity
  end

  def index
    render :json => {
      name: 'chan myae aung',
      score: 3
    }
  end

  def insert_score
    @Score = Score.new(player_params)
    if !@Score.valid?
      render :json => {
        messages: @Score.errors.full_messages.as_json
      }, status: 400
      return
    end
    if @Score.save
      render :json => {
        message: 'Data created successfully.',
        created_score: @Score
      }
    else
      render :json => {
        messages: "Couldn't create score"
      }, status: 400
    end
  end

  def delete_score
    @Score = Score.find(params[:id])
    @Score.destroy
    render :json => {
      message: 'Data deleted successfully.',
      deleted_score: @Score
    }
  end

  def score_list
    @offset = (search_params[:page] - 1) * search_params[:limit] + 1
    @dateFrom = search_params[:dateFrom]
    @dateTo = search_params[:dateTo]
    @players = search_params[:players]
    @players = @players.map { |elem| elem.downcase }
    @Score = Score.where(nil)
    @Score = @Score.filter_by_dateFrom(@dateFrom) if @dateFrom.present?
    @Score = @Score.filter_by_dateTo(@dateTo) if @dateTo.present?
    @Score = @Score.filter_by_player_name(@players) if @players.present?
    @Score = @Score.filter_by_offset(@offset)
    @Score = @Score.filter_by_limit(search_params[:limit])
    @Score.order('player_name ASC')

    render :json => @Score
  end

  def player_history
    @name = params[:player].downcase
    @Score = Score.where('lower(player_name) = ?', @name)
    @top = Score.where('lower(player_name) = ?', @name).maximum(:score)
    @lowest = Score.where('lower(player_name) = ?', @name).minimum(:score)
    @average = Score.where('lower(player_name) = ?', @name).average(:score)
    render :json => {:top_score => @top, :lowest_score => @lowest,
      :average_score => @average,
      :score_list => @Score }
  end

  def score_by_id
    @Score = Score.find(params[:id])
    render :json => @Score
  end

  private

  def player_params
    params.require(:players).permit(:player_name, :score, :score_time)
  end

  def search_params
    params.require(:filters).permit(:page, :limit, :dateFrom, :dateTo, players: [])
  end

end
