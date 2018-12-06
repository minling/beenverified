class LinksController < ApplicationController
  after_action :set_response_header

  def show
    link = Link.where(short_url: params['path']).first
    unless link.blank?
      link.increment_access_count
      render json: {redirect: link.url} and return
    end
    render json: {error: 'This short url is not valid'}
  end

  def create
    url = request.body.read
    link = Link.new(url: url)
    if link.save
      Resque.enqueue(Title, url, link.id)
      render json: {short_url: link.short_url}
    else
      render json: {errors: link.errors.messages}
    end
  end

  def index
    links = Link.order(access_count: :desc).limit(100)
    top_links = links.map {|link| {url: link.url, short_url: link.short_url, title: link.title, access_count: link.access_count}}
    render json: {top_100: top_links}
  end

protected
  def set_response_header
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE,OPTIONS']
  end

  
end
