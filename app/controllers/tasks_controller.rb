class TasksController < ApplicationController

    def show
        @task = Task.find(params[:id])
        @task = Task.all
     
         
    end

    def create
        @task = Task.create(task_params)
        if @task.save
            redirect_to todo_path(@task.todo_id), notice: "Task was successfully created." 

        else
            redirect_to root_path
        end
    end

    def update
        @task = Task.find(params[:id])
        @task.update(task_params)
        redirect_to todo_path(@task.todo_id), notice: "Task was successfully updated."

    end

    def edit 
        @task = Task.find(params[:id])        
    end

    def destroy
        @task = Task.find(params[:id])
        @task.destroy         
        respond_to do |format|
            format.html { redirect_to todo_path, notice: "Task was successfully destroyed." }
            format.json { head :no_content }
        end
        

    end
    
    private
    def task_params
        params.require(:task).permit(:title, :done, :todo_id)
    end


end

