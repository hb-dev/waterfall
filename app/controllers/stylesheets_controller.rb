class StylesheetsController < ApplicationController
  before_action :set_stylesheet, only: [:edit, :update]
  before_action :set_font_families, only: [:new, :create, :edit, :update]

  def new
  end

  def edit
    unless current_account.stylesheet
      set_stylesheet
      @stylesheet = current_account.build_stylesheet
      render :new
    end
  end

  def create
    @stylesheet = current_account.build_stylesheet(stylesheet_params)
    if @stylesheet.save
      redirect_to @stylesheet, notice: 'Style was successfully saved.'
    else
      render :new
    end
  end

  def update
    @stylesheet.update(stylesheet_params)
    respond_with(@stylesheet)
  end

  def update
    if @stylesheet.update(stylesheet_params)
      redirect_to stylesheet_path, notice: 'Style was successfully updated.'
    else
      render :edit
    end
  end  

  private
    def set_stylesheet
      @stylesheet = current_account.stylesheet
    end

    def set_font_families
      @font_families = Stylesheet.font_families
    end

    def stylesheet_params
      params.require(:stylesheet).permit(:font_family, :font_size, :color, :border_color, :font_size_header, :color_header, :font_family_header)
    end
end
