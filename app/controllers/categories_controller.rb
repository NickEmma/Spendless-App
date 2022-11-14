class CategoriesController < ApplicationController
 skip_before_action :authenticate_user!, only: [:splash]

 def index
 end

 def splash
 end
end