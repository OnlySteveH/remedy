class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:destroy, :edit, :show, :update]
  access  all: [:index, :show, :angular], 
          user: {except: [:create, :destroy, :edit, :new, :sort, :update]}, 
          site_admin: :all
	layout 'portfolio'
  
	def index
    @page_title = "Our services"
		@portfolio_items = Portfolio.by_position
	end

  def angular
    @angular_portfolio_items = Portfolio.angular
  end

	def new
		@portfolio_item = Portfolio.new
    # ugly solution to this - needs coffee
    3.times { @portfolio_item.technologies.build }
	end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, 
                      notice: 'Portfolio was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def sort
    if logged_in?(:site_admin)
      params[:order].each do |key, value|
        Portfolio.find(value[:id]).update(position: value[:position])
      end
      puts "Inside if statement as :site_admin"
    end
    # don't look for a sort view
    head :ok
  end

  def show

  end

  def destroy
    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_path, 
                    notice: 'Record was removed.' }
    end
  end

  private

    def portfolio_params
      params.require(:portfolio).permit(:title, 
                                        :subtitle, 
                                        :body, 
                                        :main_image,
                                        :thumb_image,
                                        technologies_attributes: [:name]
                                        )
    end

    def set_portfolio_item
      @portfolio_item = Portfolio.find(params[:id])
    end
end
