class AdoptionsController < ApplicationController

  before_action :set_adoption, only: [:update, :edit, :show, :destroy ]

  def new
    @tree = Tree.find(params[:tree_id])
    @adoption = Adoption.new
    authorize @adoption
  end

  def create
    @user = current_user
    @adoption = Adoption.new(adoption_params)
    tree = Tree.find(params[:tree_id])
    @adoption.user = @user
    @adoption.tree = tree
    authorize @adoption
      if @adoption.save
        redirect_to adoption_path(@adoption)
      else
        render :new
      end
  end

  def index
    @adoptions = current_user.adoptions
    @adoption = current_user.adoptions.new
  end

  def show
    # @user = current_user
    @adoptions = current_user.adoptions
    @adoption = Adoption.find(params[:id])
    @tree = Tree.find(@adoption.tree_id)
      authorize @adoption
  end


  def destroy
    # @adoption = adoption.find(params[:id])
    @adoption.destroy
    redirect_to trees_path
  end

  private

  def set_adoption
    @adoption = Adoption.find(params[:id])
    authorize @adoption
  end

  def adoption_params
    params.require(:adoption).permit(:user_id, :tree_id, :starts_at, :ends_at, :name)
  end
end
