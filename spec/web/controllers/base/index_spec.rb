RSpec.describe Web::Controllers::Base::Index, type: :action do
  let(:action)     { described_class.new }
  let(:params)     { Hash[] }
  let(:repository) { TeamRepository.new }

  before do
    repository.clear

    @team = repository.create(name: 'Liverpool FC', api_team_id: 1)
  end

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq(200)
  end

  it 'exposes all teams' do
    action.call(params)
    expect(action.exposures[:teams]).to eq([@team])
  end
end
