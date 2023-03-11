require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Ola Mag', email: 'olamag@mail.com', password: '1234567') }

  before { subject.save }

  it 'should validate user' do
    expect(subject).to be_valid
    subject.name = ''
    expect(subject).to_not be_valid
  end
end
