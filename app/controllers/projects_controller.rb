class ProjectsController < ApplicationController

  def index
    @projects = Project.search(params[:search]).page(params[:page]).per_page(10)
  end

  def show
    @project = Project.find(params[:id])
    @comment = Comment.new
    @comment.project_id = @project.id
    increment_counter(@project)
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new(project_params)
    @project.save
    redirect_to root_path
  end


  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project.destroy
  end


  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_params
    params.require(:project).permit(:title, :description, :tag_list)
  end

  def increment_counter (project)
    project.watch_count = project.watch_count + 1
    project.save
  end


end
