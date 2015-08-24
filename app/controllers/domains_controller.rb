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

  def update
  end

  private

  def domain_params
    params.require(:domain).permit(:majestic_topic, :site_topic, :links)
  end

end