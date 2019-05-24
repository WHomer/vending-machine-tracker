require 'rails_helper'

RSpec.describe 'As a user' do
  describe 'when i visit a vending machine show page' do
    it 'shows all the snacks for each vending machine' do
      o1 = Owner.create!(name: 'owner_1')
      m1 = o1.machines.create!(location: 'location 1')

      s1 = m1.snacks.create!(name: 'snack 1', price: '5.55')
      visit machine_path(m1.id)

      expect(page).to have_content(s1.name)
      expect(page).to have_content(s1.price)
      expect(page).to have_content("Average Price: $5.55")

    end
  end
end