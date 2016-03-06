require('minitest/autorun')
require_relative('../models/bookmark')

class TestBookmark <Minitest::Test


  def setup
    options = {
      'first_name' => 'Claire',
      'last_name' => 'Anderson',
      'title' => 'Winterfell',
      'genre' => 'fantasy',
      'url' => 'http://www.theguardian.com/uk'
    }

    @bookmark= bookmark.new(options)

  end
  def test_pretty_name()
    assert_equal( 'Claire Anderson', @bookmark.pretty_name() )
  end


end