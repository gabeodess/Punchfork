require 'test_helper'

class PunchforkTest < ActiveSupport::TestCase
    
  def setup
    Punchfork.setup do |config|
      config.api_key = "35d33aa134899fc2"
    end
  end
  
  test "truth" do
    assert_kind_of Module, Punchfork
  end
  
  test "search should get 50 results" do
    response = Punchfork.search(:tomatoes, count:50)
    assert_equal 50, response['recipes'].length
  end
end

