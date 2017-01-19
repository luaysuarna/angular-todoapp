class Api::V1::BoardsController < ApiController

  def index
    render json: success_api("", boards: Board.select(:id, :name).limit(5))
  end

  def create
    board = Board.new(board_params)

    if board.save
      render json: success_api("Board has created successfully.", board: board)
    else
      render json: failed_api(board.errors.full_message.first, board: board)
    end
  end

  def search
    render json: success_api("", boards: Board.select(:id, :name).where('lower(name) LIKE ?', "%#{params[:query].try(:downcase)}%").limit(5))
  end

  private

    def board_params
      params.require(:board).permit(:id, :name, :query)
    end

end
