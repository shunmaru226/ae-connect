class WorksController < ApplicationController
  before_action :require_user_logged_in
  # before_action :correct_user, only: [:edit, :destroy]

  def index
    @pagy, @users = pagy(User.order(id: :desc), items: 50)
  end

  def show
    @user = current_user 
    
  end

  def create
  end

  def edit
      @user = current_user 
      # @genres = @user.work&.genres&.map do |r| r.name end
      
      @genres = []
      if @user.work
        @genres = @user.work.genres.map do |r| r.name end
      end
      # @work = current_user.build_work
      # @work = Work.initialize_or_find_by(user_id: @user.id)

    # @work = current_user.works.build(work_params)
    if @user.save
      flash[:success] = 'プロフィール編集に成功しました'
      render 
    else
      @pagy, @user = pagy(current_user.works.order(id: :desc))
      flash.now[:danger] = 'プロフィール編集に失敗しました'
      render 
    end
  end

  def destroy
    @work.destroy
  end
  
  private

  # def works_params
  #   params.require(:work).permit(:email)
  # end

  # def correct_user
  #   @work = current_user.works.find_by(id: params[:id])
  #   unless @work
  #     redirect_to root_url
  #   end
  # end
end
