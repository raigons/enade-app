require 'rails_helper'

RSpec.describe Institution, type: :model do
  it { should have_many(:courses) }
  it { should accept_nested_attributes_for(:courses).allow_destroy(false) }
end
