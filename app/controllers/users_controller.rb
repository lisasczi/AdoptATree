class UsersController < ApplicationController

  def index
    @adoptions = current_user.adoptions
    @adoption = current_user.adoptions.new
  end

  def show
    @adoption = Adoption.find(params[:id])
    @tree = Tree.find(@adoption.tree_id)
    @user = current_user
      authorize @adoption
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
