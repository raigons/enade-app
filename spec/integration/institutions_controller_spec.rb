require 'rails_helper'

RSpec.describe InstitutionsController, type: :request do
  describe 'GET /institutions' do
    it "lists institutions" do
      institution = Institution.create!(name: "Institution 1", general_score: 99.87)
      get '/institutions'

      expect(response).to render_template(:index)
      expect(response.body).to include("Institution 1")
      expect(response.body).to include("Nota: 99.87")
    end
  end

  describe 'POST /institutions' do
    it "creates a new institution" do
      get '/institutions/new'

      expect(response).to render_template(:new)

      post "/institutions", params: { institution: { name: "Institution" } }

      expect(response).to redirect_to(assigns(:institution))
      follow_redirect!

      expect(response).to render_template(:show)
    end
  end

  describe 'PUT /institutions/:id' do
    it "sets a score for the institution" do
      institution = Institution.create!(name: "Institution With no score")

      put "/institutions/#{institution.id}", params: { institution: { general_score: 80.5 } }

      follow_redirect!

      expect(response).to render_template(:index)

      expect(response.body).to include("Institution With no score")
      expect(response.body).to include("Nota: 80.5")
    end
  end
end
