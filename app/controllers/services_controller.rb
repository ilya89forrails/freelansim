class ServicesController < ApplicationController

  def index
    @services = Service.search(params[:search]).page(params[:page]).per_page(10)
  end

  def show
    @service = Service.find(params[:id])
  end

  def new
    @service = Service.new
  end

  def edit
  end

  def create
    @service = Service.new(project_params)
    @service.save
  end


  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to @service, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @service.destroy
  end


  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_params
    params.require(:service).permit(:name, :description, :price, :tag_list)
  end


end
