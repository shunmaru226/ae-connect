class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]

  def index
    @pagy, @users = pagy(User.order(id: :desc), items: 50)
  end
  
  def show
    @user = User.find(params[:id])
    
    # @user = current_user 
    #   if @user.author_flag == 1
    #   elsif @user.author_flag == 0
    #   end
  end
  
  def edit 

  end
    
    
  def new
    @user = User.new
  end 
  
  def create
    @user = User.new(user_params)
    genres = nil
    if params[:work]
       genres = params[:work][:genre_ids]
    end

    if (@user.save) 
      flash[:success] = "ユーザー登録できました。"
      #if (@user.auther_flag)
      #   redirect_to creater_home(@user)
      # else
      #   redirect_to editor_home(@user)
      # end
      
      if (genres)
        genres.map! do |genre| genre.to_i end
        genres.reject! do |i | i == 0 end
        @user.work.genre_ids = genres
      end
                  
      
      redirect_to @user
    else
      flash[:error] = "ユーザー登録できませんでした。"
      render :new
    end

  end  
  
  def update
    @user = User.find(params[:id])
    
    @genres = params[:work][:genre_ids]
    
    if (@user.update(user_params))
        flash[:success] = "ユーザー更新成功"
        
          @genres.map! do |genre| genre&.to_i end
          @genres.reject! do |i | i == 0 end
          @user.work.genre_ids = @genres
                  
        redirect_to mypage_url
    else
          flash[:error] = "ユーザー登録できませんでした。"
          render 'works/show'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :author_flag, :body, :image,
      work_attributes:[:link_url, :age, :career, :assistant_history, :drawing_form, :working_style, :genre,
       :sns_url, :profile, genres_ids:[]])
  end
  
# "work_attributes"=>{"link_url"=>"aaaaa", "age"=>"", "career"=>"ジャンプ賞", "assistant_history"=>"おだえいいちろう",
# "drawing_form"=>"デジタル", "working_style"=>"在宅", "genre"=>"", "sns_url"=>"", "profile"=>"がんばります  
  
  
end
