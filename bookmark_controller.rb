require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
require('./models/bookmark')
require_relative('./models/bookmark')



get '/bookmark' do
  @bookmark = Bookmark.all()
  erb ( :index )
end

get '/bookmark/new' do

  erb(:new)
end

#SHOW
get '/bookmark/:id' do
  @bookmark = Bookmark.find(params[:id])
  erb(:show)
end

#EDIT
get '/bookmark/:id/edit' do
  @bookmark = Bookmark.find(params[:id])
erb(:edit)
end


#update
post '/bookmark/:id' do
 @bookmark = Bookmark.update(params)
 redirect to("/bookmark/#{params[:id]}")
end



#CREATE
post '/bookmark' do 
  @bookmark = Bookmark.new( params )
  @bookmark.save
  erb( :create )
end

#SEARCH
# post '/bookmark' do
#not sure how to do this




#DESTROY
post '/bookmark/:id/delete' do
  Bookmark.destroy( params[:id])
  redirect to('/bookmark')
end