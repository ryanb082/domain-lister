class DomainsController < ApplicationController

http_basic_authenticate_with name: 'adamryan', password: 'seokings'

  def index
    @domains = Domain.all
  end

  def create
  @domain = Domain.new(domain_params)


    if @domain.save

      flash[:notice] = "Your domain was listed"
      redirect_to root_path
    else
      render :new
    end
  end

  def new
    @domain = Domain.new   
  end

  def edit
    @domain = Domain.find(params[:id])

  end

  def update
    @domain = Domain.find(params[:id])
    if @domain.update(domain_params)
      flash[:notice] = "This domain was updated."
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @domain = Domain.find(params[:id]).destroy
    redirect_to root_path
  end

  private

  def domain_params
    params.require(:domain).permit(:domain,:majestic_topic, :site_topic, :links)
  end

end