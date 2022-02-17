class Admin::GenresController < ApplicationController
  def index
    @admin/geners = Admin/genres.new
  end 
  
  
  def create
    # １. データを新規登録するためのインスタンス作成
    @admin/genres = Admin/genres.new(admin/genres_params)
    # ２. データをデータベースに保存するためのsaveメソッド実行
    @admin/genres.save
    # ３. トップ画面へリダイレクト
    redirect_to 'admin/genres'
  end

  private
  # ストロングパラメータ
  def list_params
    params.require(:admin/genres).permit(:name)
  end
end
