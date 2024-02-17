class ToppagesController < ApplicationController


    def index
        if (logged_in? && params[:q] == nil)
            @pagy, @users = pagy(User.all.order("created_at desc"))
        else
            @users = nil
        end
        @q = Work.ransack(params[:q])

        if (params[:q])
            @works = @q.result.includes(:work, :profile_or_history).order(created_at: :desc)
            @users = @works.map do |work| work.user end
        end
    end

end
