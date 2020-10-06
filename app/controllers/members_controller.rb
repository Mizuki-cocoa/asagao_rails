class MembersController < ApplicationController
    def index
    @members = Member.order("number")
    end

    # 検索
    def search
        @members=Member.search(params[:q],params[:man],params[:lady])
        render "index"
        #index.html.erbでの参照
        #controllerには死んでも処理をかきすぎないという強い意志が大事
    end

    # 会員情報の詳細
    def show
    @member = Member.find(params[:id])
    render index
    end

    def new
    end

    def edit
    end

    def create
    end

    def update
    end

    def destory
    end
end
