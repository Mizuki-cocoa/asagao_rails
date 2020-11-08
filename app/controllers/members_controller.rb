class MembersController < ApplicationController
  before_action :login_required
  # 会員一覧
  def index
    @members = Member.order("number").page(params[:page]).per(15)
  end

  # 検索
  def search
    @members = Member.search(params[:q],params[:man],params[:lady]).page(params[:page]).per(15)
    render "index"#index.html.erbでの参照
  end

  # 会員情報の詳細
  def show
    @member = Member.find(params[:id])
  end
end
