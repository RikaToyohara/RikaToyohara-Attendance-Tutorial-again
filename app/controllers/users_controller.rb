class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :logged_in_user, only: [:show, :edit, :update] # editとupdateアクションが実行される直前にloged_in_userが実行される
  before_action :correct_user, only: [:edit, :update]                                                          
  def show
    @user = User.find(params[:id])
  end  
    
  def new
    @user = User.new #form_withの引数で必要となるユーザーオブジェクトを作成、インスタンス変数に代入
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user # 保存成功後、ログイン
      flash[:success] = '新規作成に成功しました。'
      redirect_to @user
    else
      render :new
    end
  end 
  
  def edit
    @user = User.find(params[:id])
  end  
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "ユーザー情報を更新しました。"
      redirect_to  @user
    else
      render :edit
    end
  end  
    
    
  
  private 
        # このキー以降のコードをわかりやすくするため、以降字下げ
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
     # beforeフィルター
     
     # paramsハッシュからユーザーを取得
     def set_user
       @user = User.find(params[:id])
     end
     
     # ログイン済みのユーザーか確認
    def logged_in_user
      unless logged_in?   # unlessは条件式がfalseの場合のみ記述した処理が実行できる構文
        store_location
        flash[:danger] = "ログインしてください。"
        redirect_to login_url
      end
    end 
    
    # アクセスしたユーザーが現在ログインしているユーザーか確認
    def correct_user
      redirect_to(root_url) unless current_user?(@user)
    end  
end

