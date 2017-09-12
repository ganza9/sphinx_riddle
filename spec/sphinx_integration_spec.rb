require ('capybara/rspec')
require ('./app')
require('sinatra')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("Riddles", {:type => :feature}) do
  # it('produces a random number between 1 and 10') do
  #   visit('/')
  #
  #   expect(page).to have_content(1..10)
  # end
end
