require('minitest/autorun')
require_relative('../models/bookmark')

class TestKitsu <Minitest::Test


  def setup
    options = {
      'first_name' => 'Claire',
      'last_name' => 'Anderson',
      'title' => 'Winterfell',
      


    }

    @bookmark= bookmark.new(options)

  end



end