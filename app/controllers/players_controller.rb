class PlayersController < ApplicationController
  skip_before_action :verify_authenticity_token, if: :json_request?, only: [:update, :create]

  def index
    players = Player.all

    render :json => player_json_response(players)
  end

  def create
    player = Player.new(new_player_params)
    if player.save
      render :json => player_json_response(player), status: :created
    else
      render :json => player_json_response(player), status: :unprocessable_entity
    end
  end

  def update
    player = Player.find(params[:id])

    player.update(new_player_params)

    if player.save
      render :json => player_json_response(player), status: :ok
    else
      render :json => player_json_response(player), status: :not_modified
    end
  end

  def show
    player = Player.find(params[:id])

    render :json => player_json_response(player)
  end

  private

  def player_json_response(player)
    player.to_json(only: [:id, :name, :franchise, :price, :points, :role])
  end

  def new_player_params
    params.require(:player).permit(:name, :franchise, :role, :price, :points)
  end
end
