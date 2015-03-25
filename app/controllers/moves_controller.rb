class MovesController < ApplicationController
def index
    @moves = Move.all 

    render(:template => "moves/index")
  end

  def show
    @move = Move.find(params[:id])
  end

  def new
    @move = Move.new

    render(:template => "moves/new")
  end

  def create
    @move = Move.new(move_params)

    if @move.save
      redirect_to move_path(@move.id)
    else
      render(:template => "moves/index")
    end
  end

  def edit
    @move = Move.find(params[:id])

    render(:templace => "moves/edit")
  end

  def update
    @move = Move.find(params[:id])

    if @move.update(move_params)
      redirect_to move_path(@move)
    else
      render(:template => "moves/edit")
    end
  end

  def destroy
    @move = Move.find(params[:id])
    @move.destroy!
    redirect_to moves_path
  end

  def move_params
    params.require(:move).permit!
  end
end
