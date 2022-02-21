class Admin::GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.all
  end


  def create
    # １. データを新規登録するためのインスタンス作成
    @genre = Genre.new(genre_params)
    # ２. データをデータベースに保存するためのsaveメソッド実行
    @genre.save
    # ３. トップ画面へリダイレクト
    redirect_to 'admin/genres'
  end

  private
  # ストロングパラメータ
  def _params
    params.require(:genre).permit(:name)
  end
end
