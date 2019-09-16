require "json"
require "selenium-webdriver"
require "rspec"
include RSpec::Expectations

describe "Add Product to the Cart" do
    before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @base_url = "https://www.williams-sonoma.com/"
    @driver.manage.timeouts.implicit_wait = 30
  end

  after(:each) do
    @driver.quit
  end   
    
  it "add product to the cart successfully" do
    @driver.get "https://www.williams-sonoma.com/"

    @driver.find_element(:xpath, "/html/body/header/div[4]/nav/ul/li[3]/a").click
    @driver.find_element(:xpath, "/html/body/div[3]/main/div[3]/div[1]/ul[2]/li[1]/a").click
    @driver.find_element(:xpath, "/html/body/div[3]/main/div[4]/div[3]/ul/li[1]/a[2]").click
    @driver.find_element(:id, "primaryGroup_addToCart_0").click
   
    @driver.find_element(:id, "anchor-btn-checkout").click
    elem = @driver.find_element('a', text: "
      Wüsthof Classic White 7-Piece Block Set
      ")
    elem.text.should eql('
      Wüsthof Classic White 7-Piece Block Set
      ')
  end
end
