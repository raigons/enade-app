require 'rails_helper'

RSpec.describe ApplicationController, type: :request do
  describe 'root router' do
    it "should redirect to institution index as root" do
      get '/'

      expect(response).to render_template(:index)
      expect(response.body).to include("Instituições")
    end
  end
end
