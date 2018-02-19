class CoursesController < ApplicationController
  def new
    @course = Course.new
  end

  def index
    @courses = Course.all
  end

  def show
    @course = course
  end

  def create
    @course = Course.new(course_params)
    @course.save!

    redirect_to courses_url
  end

  def edit
    @course = course
  end

  private
    def course
      Course.find(params[:id])
    end

    def course_params
      params.require(:course).permit(:name)
    end
end
