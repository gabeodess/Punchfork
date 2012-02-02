require 'test_helper'

class PunchforkTest < ActiveSupport::TestCase
    
  def setup
  end
  
  test "truth" do
    assert_kind_of Module, Punchfork
  end
  
  test "search should get 50 results" do
    response = Punchfork.search(:tomatoes, count:50)
    assert_equal 50, response['recipes'].length
  end
  
  test "search should support strings with spaces" do
    Punchfork.search('Heirloom Tomatoes')
  end
  
end

