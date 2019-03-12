class ChatsController < ApplicationController

  def index
    render json: Chat.all
  end

  # def show
  #   render json: Chat.find(params["id"])
  # end
  #
  # def create
  #   render json: Chat.create(params["song"])
  # end
  #
  # def delete
  #   render json: Chat.delete(params["id"])
  # end
  #
  # def update
  #   render json: Chat.update(params["id"], params["song"])
  # end
end
