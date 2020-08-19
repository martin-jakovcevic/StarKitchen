require 'rails_helper'

RSpec.describe User do
  context "when saving" do
    it "transform email to lower case" do
      martin = create(:user, email: 'MARTIN@MARTIN.COM')
      expect(martin.email).to eq 'martin@martin.com'
    end
  end

  describe 'validations' do
    context 'when name is not present' do
      it 'is invalid' do
        martin = build(:user, name: nil)

        expect(martin.valid?).to be false
      end
    end

    context 'when email is not present' do
      it 'is invalid' do
        martin = build(:user, email: nil)

        expect(martin.valid?).to be false
      end
    end

    context 'when password is not present' do
      it 'is invalid' do
        martin = build(:user, password: nil)

        expect(martin.valid?).to be false
      end
    end

    context 'when password_confirmation is mismatch with password' do
      it 'is invalid' do
        martin = build(:user, password: 'martin', password_confirmation: "")

        expect(martin.valid?).to be false
      end
    end
  end
end
