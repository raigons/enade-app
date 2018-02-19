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

    it "lists ordered by score" do
      institution = Institution.create!(name: "Institution 1", general_score: 99.87)
      institution_2 = Institution.create!(name: "Institution 2", general_score: 93.5)
      institution_3 = Institution.create!(name: "Institution 3", general_score: 100)

      get '/institutions'

      expect(response.body).to include("1: <a href=\"/institutions/3\">Institution 3</a>")
      expect(response.body).to include("2: <a href=\"/institutions/1\">Institution 1</a>")
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

      expect(response.body).to include("Institution With no score")
      expect(response.body).to include("80.5")
    end

    it "sets courses to an institution" do
      math = Course.create!(name: "Matematica")
      bio = Course.create!(name: "Biologia")
      chem = Course.create!(name: "Química")
      institution = Institution.create!(name: "PUC")

      put "/institutions/#{institution.id}", params: { institution: { course_ids: [math.id, chem.id] } }
      follow_redirect!

      expect(response.body).to include("PUC")
      expect(response.body).to include("<li>
        Matematica
      </li>")

      expect(response.body).to include("<li>
        Química
      </li>")

      expect(response.body).to_not include("<li>
        Biologia
      </li>")
    end
  end
end
