class MembersController < ApplicationController
    def index
        @member = Member.new
        @members = Member.all
    end

    def create
        member = Member.create(member_params)

        if member.valid?
            redirect_to :root
        else
            flash[:error] = "Error saving Member"
            redirect_to :root
        end
    end

private

    def member_params
        params.require(:member).permit(:name, :avatar)
    end
end
