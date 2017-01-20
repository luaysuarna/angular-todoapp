class Api::V1::TodosController < ApiController

  before_action :set_board, only: [:index]
  before_action :set_task,  only: [:update, :destroy, :activator]

  def index
    render json: success_api("", tasks: @board.tasks.select(:id, :name, :done))
  end

  def create
    task = Task.new(task_params)

    if task.save
      render json: success_api("Task successfully created.", task: task)
    else
      render json: failed_api(task.errors.full_messages.first, task: task)
    end
  end

  def update
    if @task.update_attributs(task_params)
      render json: success_api("Task successfully updated.", task: @task)
    else
      render json: failed_api(@task.errors.full_messages.first, task: @task)
    end
  end

  def destroy
    if @task.destroy
      render json: success_api("Task successfully destroyed.", task: @task)
    else
      render json: failed_api(@task.errors.full_messages.first, task: @task)
    end    
  end
  
  def activator
    @task.toggle!(:done)

    render json: success_api("Task successfully updated.", task: @task)
  end

  private

    def task_params
      params[:task][:user_id] = current_user.id
      params.require(:task).permit(:id, :name, :description, :board_id, :user_id)
    end

    def set_task
      @task = Task.find(params[:id])
    end

    def set_board
      @board = Board.find(params[:board_id])
    end

end
