class HomeController < ApplicationController

  def index
    @new_list = Relationship.new
  end

end
