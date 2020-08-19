require 'rails_helper'

RSpec.describe User do
  context "when saving" do
    it "transform email to lower case" do
      martin = User.create(email: 'MARTIN@MARTIN.COM', name: 'Testing', password: 'martin', password_confirmation: 'martin')

      expect(martin.email).to eq 'martin@martin.com'
    end
  end



end
