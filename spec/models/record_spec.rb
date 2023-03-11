require 'rails_helper'

RSpec.describe Record, type: :model do
  subject do
    user = User.new(name: 'Ola Mag', email: 'olamag@mail.com', password: '1234567')
    Record.new(name: 'Apple MacBook pro', amount: 2_000_000, user:)
  end

  before { subject.save }

  it 'should be valid' do
    expect(subject).to be_valid
  end

  it 'should have a name and an amount' do
    subject.name = ''
    subject.amount = nil

    expect(subject).to_not be_valid
  end
end
