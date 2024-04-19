require 'rails_helper'

RSpec.describe "orders/show", type: :view do
  before(:each) do
    assign(:order, Order.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
