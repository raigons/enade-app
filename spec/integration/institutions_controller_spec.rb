require 'rails_helper'

RSpec.describe InstitutionsController, type: :request do
  it "lists institutions" do
    institution = Institution.create!(name: "Institution 1", general_score: 99.87)
    get '/institutions'

    expect(response).to render_template(:index)
    expect(response.body).to include("Institution 1 - Nota: 99.87")
  end
end
