RSpec.describe Web::Views::Base::Index, type: :view do
  let(:exposures) { Hash[teams: []] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/base/index.html.erb') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #teams' do
    expect(view.teams).to eq exposures.fetch(:teams)
  end

  context "if there are no teams" do
    it "doesn't list teams" do
      expect(view.teams.size).to eq 0
    end

    it "shows placeholder" do
      expect(rendered).to include('<p class="placeholder">There are no teams yet.</p>')
    end
  end

  context "if there are teams" do
    let(:team1)     { Team.new(name: "Liverpool FC") }
    let(:team2)     { Team.new(name: "Manchester United") }
    let(:exposures) { Hash[teams: [team1, team2]] }

    it 'lists them all' do
      expect(rendered.scan(/class="team"/).length).to eq(2)
      expect(rendered).to include("Liverpool FC")
      expect(rendered).to include("Manchester United")
    end

    it 'hides the placeholder message' do
      expect(rendered).not_to include('<p class="placeholder">There are no teams yet.</p>')
    end
  end
end
