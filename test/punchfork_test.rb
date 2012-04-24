require 'test_helper'

class PunchforkTest < ActiveSupport::TestCase
    
  def setup
  end
  
  test "should use http by default" do
    Punchfork.setup { |config| config.protocol = 'http' }
    assert_equal 'http', URI.parse(Punchfork.search_url(:tomatoes).to_s).scheme
  end
  
  test "should use https" do
    Punchfork.setup { |config| config.protocol = 'http' }
    assert_equal 'https', URI.parse(Punchfork.search_url(:tomatoes, protocol: :https).to_s).scheme
  end
  
  test "should configure default to https" do
    Punchfork.setup { |config| config.protocol = 'https' }
    assert_equal 'https', URI.parse(Punchfork.search_url(:tomatoes).to_s).scheme
  end
  
  test "truth" do
    assert_kind_of Module, Punchfork
  end
  
  test "search should get 50 results" do
    response = Punchfork.search(:tomatoes, count:50)
    assert_equal 50, response['recipes'].length
  end
  
  test "should support method calls" do
    response = Punchfork.search(:tomatoes, count:50)
    assert_equal 50, response.recipes.length
  end
  
  test "search should support strings with spaces" do
    Punchfork.search('Heirloom Tomatoes')
  end
  
end

