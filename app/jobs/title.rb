class Title
  include HTTParty

  @queue = :title

  def self.perform(url, id)
    title = Nokogiri::HTML::Document.parse(HTTParty.get(url).body).title
    link = Link.find(id)
    link.update(title: title)
  end

end
