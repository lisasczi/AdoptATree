class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :trees,  dependent: :destroy
  has_many :adoptions, dependent: :destroy
  has_many :reviews

  # def unavailable_dates
  #   adoptions.pluck(:starts_at, :ends_at).map do |range|
  #     { from: range[0], to: range[1] }
  #   end
  # end

  def profile
    unless current_user.has_profile?
      redirect_to new_user_session_path
    end
    @user = current_user.profile
  end
end
