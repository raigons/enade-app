class InstitutionsController < ApplicationController
  def new
    @institution = Institution.new
  end

  def index
    @institutions = Institution.all.order(general_score: :desc)
  end

  def show
    @institution = institution
  end

  def create
    @institution = Institution.new(institution_params)
    @institution.save!

    redirect_to @institution
  end

  def edit
    @institution = institution
    @institution.courses_institutions.build
  end

  def update
    @institution = institution

    add_score_to_course
    add_courses_to_institution

    @institution.update(institution_params)

    redirect_to @institution
  end

  private
    def add_score_to_course
      # params[:institution][:courses_institutions_attributes].each do |index, course_institution|
      #
      # end
    end

    def add_courses_to_institution
      params[:institution][:course_ids].reject(&:blank?).each do |value|
        course = Course.find(value)
        @institution.courses << course
      end if params[:institution][:course_ids].present?
    end

    def institution
      Institution.find(params[:id])
    end

    def institution_params
      params.require(:institution).permit(:name, :general_score, :course_ids)
    end
end
