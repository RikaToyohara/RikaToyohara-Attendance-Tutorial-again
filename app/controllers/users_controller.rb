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
      flash[:success] = '新規作成に成功しました。'
      ridirect_to @user
    else
      render :new
    end
  end 
  
  private 
        # このキー以降のコードをわかりやすくするため、以降字下げ
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end

