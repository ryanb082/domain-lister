class DomainsController < ApplicationController

before_action :require_user 

  def index
    @domains = Domain.all
  end

  def create
  @domain = Domain.new(domain_params)


    if @domain.save

      flash[:notice] = "Your domain was listed"
      redirect_to domains_path
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
      redirect_to domains_path
    else
      render :edit
    end
  end

  def destroy
    @domain = Domain.find(params[:id]).destroy
    redirect_to domains_path
  end

  def import
    Domain.import(params[:file])
    redirect_to domains_path, notice: "Domains added successully."
  end

  private

  def domain_params
    params.require(:domain).permit(:domain,:majestic_topic, :site_topic, :links)
  end

end