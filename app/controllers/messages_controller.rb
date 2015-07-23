class MessagesController < ApplicationController
  def index
    @users_count = User.count
  end
end
