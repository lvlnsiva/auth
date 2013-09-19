class TodosController < ApplicationController
  before_filter :require_login
  
  def new
    @todo=Todo.new
  end
  def create 
      @todo=Todo.new params[:todo]
      respond_to do |format|
        if @todo.save
          format.html { redirect_to @todo, :notice => 'todo was successfully created.' }
          format.json { render json: @todo, status: :created, location: @todo}
        else
          format.html { render action: "new"}
          format.json { render json: @todo.errors, status: :unprocessable_entity, :notice => 'error occured' }
       end
      end
  end
  def index
    @todos = Todo.all
  end
  def edit
    @todo = Todo.find(params[:id])
  end
  def show
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])    
    if @todo.update_attributes(params[:todo])
      render :action => 'show'
    else
      render :action => 'edit'
    end  
  end
  def back
    
  end
  
                 
end