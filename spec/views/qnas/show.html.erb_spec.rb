require 'rails_helper'

RSpec.describe "qnas/show", type: :view do
  before(:each) do
    @qna = assign(:qna, Qna.create!(
      :ques => "Ques",
      :mail => "Mail"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Ques/)
    expect(rendered).to match(/Mail/)
  end
end
