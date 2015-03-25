class UserCreaturesController < ApplicationController
def index
    @user_creatures = UserCreature.all 

    render(:template => "user_creatures/index")
  end

  def show
    @user_creature = UserCreature.find(params[:id])
  end

  def new
    @user_creature = UserCreature.new

    render(:template => "user_creatures/new")
  end

  def create
    @user_creature = UserCreature.new(user_creature_params)

    if @user_creature.save
      redirect_to user_creature_path(@user_creature.id)
    else
      render(:template => "user_creatures/index")
    end
  end

  def edit
    @user_creature = UserCreature.find(params[:id])

    render(:templace => "user_creatures/edit")
  end

  def update
    @user_creature = UserCreature.find(params[:id])

    if @user_creature.update(user_creature_params)
      redirect_to user_creature_path(@user_creature)
    else
      render(:template => "user_creatures/edit")
    end
  end

  def destroy
    @user_creature = UserCreature.find(params[:id])
    @user_creature.destroy!
    redirect_to user_creature_path
  end

  def user_creature_params
    params.require(:user_creature).permit!
  end

end
