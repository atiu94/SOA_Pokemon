class UserCreatureMovesController < ApplicationController
def index
    @user_creature_moves = UserCreatureMove.all 

    render(:template => "user_creature_moves/index")
  end

  def show
    @user_creature_move = UserCreatureMove.find(params[:id])
  end

  def new
    @user_creature_move = UserCreatureMove.new

    render(:template => "user_creature_moves/new")
  end

  def create
    @user_creature_move = UserCreatureMove.new(user_creature_move_params)

    if @user_creature_move.save
      redirect_to user_creature_move_path(@user_creature_move.id)
    else
      render(:template => "user_creature_moves/index")
    end
  end

  def edit
    @user_creature_move = UserCreatureMove.find(params[:id])

    render(:templace => "user_creature_moves/edit")
  end

  def update
    @user_creature_move = UserCreatureMove.find(params[:id])

    if @user_creature_move.update(user_creature_move_params)
      redirect_to user_creature_move_path(@user_creature_move)
    else
      render(:template => "user_creature_moves/edit")
    end
  end

  def destroy
    @user_creature_move = UserCreatureMove.find(params[:id])
    @user_creature_move.destroy!
    redirect_to user_creature_moves_path
  end

  def user_creature_move_params
    params.require(:user_creature_move).permit!
  end
end
