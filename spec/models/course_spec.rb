require 'rails_helper'

RSpec.describe Course, type: :model do
  it { should have_many(:institutions) }
end
