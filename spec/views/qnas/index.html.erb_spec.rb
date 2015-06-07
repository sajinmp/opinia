require 'rails_helper'

RSpec.describe "qnas/index", type: :view do
  before(:each) do
    assign(:qnas, [
      Qna.create!(
        :ques => "Ques",
        :mail => "Mail"
      ),
      Qna.create!(
        :ques => "Ques",
        :mail => "Mail"
      )
    ])
  end

  it "renders a list of qnas" do
    render
    assert_select "tr>td", :text => "Ques".to_s, :count => 2
    assert_select "tr>td", :text => "Mail".to_s, :count => 2
  end
end
