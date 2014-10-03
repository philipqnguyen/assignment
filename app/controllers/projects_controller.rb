class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update,
                                     :destroy, :join_project]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  def my_desk
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @creator = @project.creator
    @participants = @project.participants
  end

  # GET /projects/new
  def new
    @project = current_user.projects.build
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = current_user.projects.build(project_params)
    current_user.projects << @project
    current_user.projects.last.mentships.where(user_id: current_user.id)[0].update(role: 'creator')

    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  def join_project
    current_user.projects << @project
    current_user.projects.find(@project).mentships.where(user_id: current_user.id)[0].update(role: 'participant')
    redirect_to @project

    # if @project.update(project_params)
    #   current_user.projects << @project
    #   current_user.projects.find(@project).mentships.where(user_id: current_user.id)[0].update(role: 'participant')
    #   redirect_to @project, notice: 'Project was successfully updated.'
    # else
    #   redirect_to @project
    # end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy

    redirect_to projects_url, notice: 'Project was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title, :content)
    end
end
