class TodosController < ApplicationController
  before_action :fetch_todo, :only => [:show, :edit, :update, :destroy, :complete]
	def index
		@todos = Todo.all
	end

  def update
    if @todo.update_attributes(todo_params)
      redirect_to todo_path(@todo)
    else
      render :action => "edit"
    end
  end

  def complete
    done = !@todo.done
    @todo.update_attributes(:done => done)
    redirect_to todos_path
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to todos_path
    else
      render :action => "new"
    end
  end

  def destroy
    @todo.destroy

    redirect_to todos_path
  end

  private
  def fetch_todo
    @todo = Todo.find(params[:id])
  end

  private
  def todo_params
    params.require(:todo).permit(:title, :due_date, :note, :done)
  end
end
