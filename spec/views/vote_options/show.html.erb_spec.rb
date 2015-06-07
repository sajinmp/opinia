require 'rails_helper'

RSpec.describe "vote_options/show", type: :view do
  before(:each) do
    @vote_option = assign(:vote_option, VoteOption.create!(
      :title => "Title",
      :poll => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(//)
  end
end
