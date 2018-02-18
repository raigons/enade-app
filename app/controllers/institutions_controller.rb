class InstitutionsController < ApplicationController
  def new
    @institution = Institution.new
  end

  def index
    @institutions = Institution.all
  end

  def show
    @institution = institution
  end

  def create
    @institution = Institution.new(institution_params)

    if @institution.save
      redirect_to @institution
    else
      render 'new'
    end
  end

  def edit
    @institution = institution
  end

  def update
    @institution = institution
    @institution.update(institution_params)

    redirect_to institutions_path
  end

  private
    def institution
      Institution.find(params[:id])
    end

    def institution_params
      params.require(:institution).permit(:name, :general_score)
    end
end
