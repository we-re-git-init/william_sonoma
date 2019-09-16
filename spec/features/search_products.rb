require "json"
require "selenium-webdriver"
require "rspec"
include RSpec::Expectations

describe "Search Product" do

  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @base_url = "https://www.williams-sonoma.com/"
    @driver.manage.timeouts.implicit_wait = 30
  end
  
  after(:each) do
    @driver.quit
  end
  
  it "let me search products successfully" do
    @driver.get "https://www.williams-sonoma.com/"
    @driver.find_element(:id, "search-field").click
    @driver.find_element(:id, "search-field").send_keys "silverware"
    @driver.find_element(:name, "nav-search-form").submit
    @driver.find_element(:xpath, "/html/body/div[3]/main/search-results/div/div[2]/div[3]/ul/li[1]/div[2]/quick-look/div/a/span").click
    @driver.find_element(:xpath, "/html/body/div[8]/div/div/div/div[2]/div/div[6]/a/img").click
    (@driver.find_element(:xpath, "/html/body/div[3]/main/div[1]/div[4]/div[2]/div[2]/h1").text).should == "Hampstead Flatware Set"
   
  end
end