class PlayersController < ApplicationController


  def index
    @players = Player.paginate(page: params[:page], :per_page => 20)
  end

  def new
    @player= Player.new
  end

  def create
    @player = Player.new(new_player_params)
    if @player.save
      redirect_to players_path
    else
      render new_player_path(@player)
    end
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])

    @player.update(new_player_params)

    if @player.save
      redirect_to players_path
    else
      render :edit
    end
  end


  private
  def new_player_params
    params.require(:player).permit(:name, :franchise, :role, :price, :points)
  end
end
