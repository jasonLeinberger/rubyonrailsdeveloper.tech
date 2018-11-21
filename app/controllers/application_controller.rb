class ApplicationController < ActionController::Base
    before_action :set_siteprop

    private 

    def set_siteprop
        @siteprop = Siteprop.first
    end
end
