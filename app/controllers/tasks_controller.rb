# TASKS = [
#   { id: 1, title: "Mow Lawn", description: "In the yard with the lawnmower", completion_date: "Tuesday"},
#   { id: 2, title: "Wash Dishes", description: "In the kitchen with a sponge", completion_date: "Saturday"},
#   { id: 3, title: "Dance a Jig", description: "In the yard with some friends", completion_date: "Friday"}
# ]

class TasksController < ApplicationController
  def index
    @tasks = Task.all.order(:title)
  end

  def show
    id = params[:id].to_i
    @task = Task.find_by(id: id)

    if @task.nil?
      render :notfound, status: :not_found
    end
  end

  def new
    @task = Task.new(title: '-No Task Name-', description: '-No Description-', completion_date: '-No Completion Date-')
  end

  def create
    @task = Task.new(task_params)
    # @task = Task.new(title: params[:task][:title], description: params[:task][:description], completion_date: params[:task][:completion_date])
    if @task.save
      redirect_to tasks_path
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id].to_i)
  end

  def update
    @task = Task.find_by(id: params[:id].to_i)
    if @task.update(task_params)
      redirect_to task_path
    else
      render :edit
    end
  end

  def destroy
    task = Task.find_by(id: params[:id].to_i)
    task.destroy

    redirect_to tasks_path
  end

  def complete
    @task = Task.find_by(id: params[:id].to_i)
    if @task.completion_date == nil
      @task.update(completion_date: Date.today)
    else
      @task.update(completion_date: nil )
    end
    redirect_to tasks_path

  end

  private

  def task_params
    return params.require(:task).permit(:title, :description)
  end
end
