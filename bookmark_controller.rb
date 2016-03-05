require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?

require_relative('./models/bookmark')


get '/bookmark/new' do

  erb(:new)
end




# database stuff
# post '/bookmark' do
#   @bookmark= Bookmark.new(params)
#   @bookmark.save()
#   erb(:create)
# end


