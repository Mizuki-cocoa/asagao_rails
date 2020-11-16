class AccountsController < ApplicationController
  #before_action :login_required
  def show
    @member=current_member
  end

  def edit
    @member=current_member
  end

  def new
    @member = Member.new(birthday: Date.new(1980,1,1))
  end
  
  def create
    @member=Member.new(params[:member])
    if @member.save
      cookies.signed[:member_id]={value: @member.id, expires: 5.minutes.from_now}
      redirect_to :root, notice: "会員登録が完了しました。"
    else
      render "new"
    end
  end

  def update
    @member=current_member
    @member.assign_attributes(params[:account])
    if @member.save
      redirect_to :account, notice: "アカウント情報を更新しました。"
    else
      render "edit"
    end
  end
end
