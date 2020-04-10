class UsersController < ApplicationController
  
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
end

