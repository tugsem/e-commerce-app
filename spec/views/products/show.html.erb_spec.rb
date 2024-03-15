require 'rails_helper'

RSpec.describe 'products/show', type: :view do
  before(:each) do
    assign(:product, Product.create!(
                       product_name: 'MyString',
                       product_quantity: 1,
                       price: '9.99',
                       product_image: 'askgjsg'
                     ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(product_name)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/9.99/)
  end
end
