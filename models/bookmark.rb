require('pg')


class Bookmark

attr_reader :first_name, :last_name, :title, :genre, :url, :id

  def initialize(options)
  @id = nil || options['id']
  @first_name = options['first_name']
  @last_name = options['last_name']
  @title = options['title']
  @genre = options['genre']
  @url = options['url']


  end

  def pretty_name()
    return @first_name.concat(" #{@last_name}")
  end

  def save()
    db = PG.connect({dbname: 'bookmark', host: 'localhost'})

    sql = "INSERT INTO tags (     
      first_name, 
      last_name,
      title,
      genre,
      url) VALUES (
      '#{@first_name}',
      '#{@last_name}',
      '#{@title}',
      '#{@genre}',
       '#{@url}'
      )"

      db.exec(sql)
      db.close
  end



  def self.all()
    db = PG.connect({ dbname: 'bookmark', host: 'localhost'})
    sql = "SELECT * FROM tags"
    bookmarks = db.exec(sql)
    result = bookmarks.map {|bookmark| Bookmark.new(bookmark)}
    db.close
    return result
  end


   def self.find( id ) #MAKE SURE THIS IS NOT A SYMBOL
      bookmark = Bookmark.run_sql( "SELECT * from tags WHERE id=#{id}")
      result = Bookmark.new( bookmark.first )
      return result
   end

    
    def self.update(options)
      sql = "UPDATE tags SET 
        first_name='#{options['first_name']}',
        last_name='#{options['last_name']}',
        title='#{options['title']}',
        genre='#{options['genre']}',
        url='#{options['url']}'
        WHERE id='#{options['id']}'"
      Bookmark.run_sql(sql)
    end

    def self.destroy(id)
      Bookmark.run_sql("DELETE FROM tags WHERE id=#{id}")
    end

    private
    def self.run_sql(sql)
      begin 
        db = PG.connect( { dbname: 'bookmark', host: 'localhost' } )
        result = db.exec(sql)
        return result
      ensure
        db.close
      end
    end

end