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
end
