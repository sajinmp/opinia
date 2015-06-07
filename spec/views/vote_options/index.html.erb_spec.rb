require 'rails_helper'

RSpec.describe "vote_options/index", type: :view do
  before(:each) do
    assign(:vote_options, [
      VoteOption.create!(
        :title => "Title",
        :poll => nil
      ),
      VoteOption.create!(
        :title => "Title",
        :poll => nil
      )
    ])
  end

  it "renders a list of vote_options" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
