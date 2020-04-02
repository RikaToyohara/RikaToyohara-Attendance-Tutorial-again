class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end  
    
  def new
    @user = User.new #form_withの引数で必要となるユーザーオブジェクトを作成、インスタンス変数に代入
  end
end
