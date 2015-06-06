require 'tracker'

june = Pass.new("test.csv")

RSpec.describe "Trip" do
  it "counts number of trips" do
    expect(june.trips.length).to eq 2
  end

  it "determines the cost per trip" do
    expect(june.response).to eq "$58.0"
  end
end
