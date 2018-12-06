class ApplicationController < ActionController::Base
    before_action :set_siteprop
    before_action :set_owner, :set_admin

    private 

    def set_siteprop
        @siteprop = Siteprop.first
        if @siteprop == nil
            @siteprop = Siteprop.new
            @siteprop.title = "Ruby on Rails Developer Application"
            @siteprop.landingheader = "Welcome to the Ruby on Rails Developer Application"
            @siteprop.landingcontent = "Please add content here!!"
            @siteprop.save
        end

    end

    def set_owner
        if User.find_by(email: ENV["OWNER_EMAIL"]) == nil
            @owner = User.new(email: ENV["OWNER_EMAIL"], password: ENV["OWNER_PASSWORD"], password_confirmation: ENV["OWNER_PASSWORD"])
            @owner.owner = true
            @owner.admin = true
            @owner.confirm
            @owner.save!
        else
            if User.find_by(email: ENV["OWNER_EMAIL"])
                @owner = User.find_by(email: ENV["OWNER_EMAIL"])
                if @owner.owner == false 
                    @owner.owner = true
                    @owner.save!
                end
                if @owner.admin == false
                    @owner.admin = true
                    @owner.save!
                end
            end
        end
    end

    def set_admin
        if User.find_by(email: ENV["ADMIN_EMAIL"]) == nil
            @admin = User.new(email: ENV["ADMIN_EMAIL"], password: ENV["AMDIN_PASSWORD"], password_confirmation: ENV["AMDIN_PASSWORD"])
            @admin.admin = true
            @admin.confirm
            @admin.save!
        end
    end
end
