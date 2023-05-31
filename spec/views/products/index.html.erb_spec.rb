require 'rails_helper'

RSpec.describe 'products/index', type: :view do
  # include Devise::Test::ControllerHelpers
  before(:each) do
    @user = User.first
    sign_in @user
    Product.create!(
      product_name: 'first',
      product_quantity: 1,
      price: '9.99',
      product_image: 'askgjsg'
    )
    Product.create!(
      product_name: 'second',
      product_quantity: 1,
      price: '9.99',
      product_image: 'askgjsg'
    )
  end

  it 'renders a list of products' do
    visit products_url
    expect(page).to have_content('MyString')
    container = find('#products')
    expect(container).to have_selector('div', count: 2)
  end
end
