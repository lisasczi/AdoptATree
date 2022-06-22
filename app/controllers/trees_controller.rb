class TreesController < ApplicationController
  before_action :set_tree, only: [:update, :edit, :show, :destroy ]


  def index
    @trees = policy_scope(Tree)
    # @user = current_user

    # @trees = Tree.all
  end

  def show

    @tree = Tree.find(params[:id])
    @adoption = Adoption.new
    @adoptions_dates = @tree.adoptions.map do |adoption|
      {
        from: adoption.starts_at,
        to: adoption.ends_at
      }
    end
    @review = Review.new
  end

  def new
    @tree = Tree.new
    authorize @tree
  end

  def create
    @tree = Tree.new(tree_params)
    @tree.user = current_user
    authorize @tree
    if @tree.save
      redirect_to trees_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @tree.user = current_user
    @tree.update(tree_params)

    redirect_to tree_path(@tree)
  end

  def destroy
      @tree.user = current_user
      @tree.destroy
    redirect_to root_path
  end



  private

  def set_tree
    @tree = Tree.find(params[:id])
    authorize @tree
  end

  def tree_params
    params.require(:tree).permit(:name, :description, :price, :fruits, :quantity_by_year, :address)
  end




end
