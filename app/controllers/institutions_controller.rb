class InstitutionsController < ApplicationController
  def index
    @institutions = Institution.all
  end

  def update
    @institution = Institution.find(params[:id])
    @institution.update(institution_params)
    redirect_to institutions_path
  end

  private
    def institution_params
      params.require(:institution).permit(:name, :general_score)
    end
end
