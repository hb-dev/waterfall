class NewsfeedsController < ApplicationController
  before_action :authenticate_account!, except: :show
	before_filter :set_form_select_options, only: [:new, :edit, :create, :update]
	rescue_from "OpenURI::HTTPError", with: :request_error

	def index
		@newsfeeds = current_account.newsfeeds
	end

	def show
		@newsfeed = Newsfeed.find(params[:id])
    @stylesheet = @newsfeed.account.stylesheet
		@items = @newsfeed.get_items
	end

	def new
		@newsfeed = current_account.newsfeeds.new
	end

	def edit
		@newsfeed = current_account.newsfeeds.find(params[:id])
	end

  def create
    @newsfeed = current_account.newsfeeds.new(newsfeed_params)
    if @newsfeed.save
      redirect_to @newsfeed, notice: 'Newsfeed was successfully created.'
    else
      render :new
    end
  end

  def update
		@newsfeed = current_account.newsfeeds.find(params[:id])
    if @newsfeed.update(newsfeed_params)
      redirect_to @newsfeed, notice: 'Newsfeed was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
		@newsfeed = current_account.newsfeeds.find(params[:id])
    if @newsfeed.destroy
      redirect_to newsfeeds_url, notice: 'Newsfeed was successfully deleted.'
    end
  end  

  private

  def newsfeed_params
    params.require(:newsfeed).permit(:name, :api_key, :channel, :material_type, :material_order, :material_start_at, :material_end_at, :material_limit)
  end 

  def set_form_select_options
		@material_types= Newsfeed.material_types.map { |t| [t.humanize, t] }
		@material_order_types= Newsfeed.material_order_types.map { |t| [t.humanize, t] }
  end 

  def get_items(newsfeed)
  	newsfeed.get_items
  end

  def request_error(exception)
  	@error = exception.message
  	render :show 
  end

end
