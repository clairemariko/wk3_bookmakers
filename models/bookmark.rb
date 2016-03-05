require('pg')


class Bookmark

attr_reader(:first_name, :last_name, :title, :genre, :url)

  def initialize(options)

  @first_name = options['first_name']
  @last_name = options['last_name']
  @title = options['title']
  @genre = options['genre']
  @url = options['url']

  end

end