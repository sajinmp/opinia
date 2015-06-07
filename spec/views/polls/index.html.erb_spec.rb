require 'rails_helper'

RSpec.describe "polls/index", type: :view do
  before(:each) do
    assign(:polls, [
      Poll.create!(
        :topic => "MyText"
      ),
      Poll.create!(
        :topic => "MyText"
      )
    ])
  end

  it "renders a list of polls" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
