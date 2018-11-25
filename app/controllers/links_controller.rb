class LinksController < ApplicationController

  def index
    link = Link.where(short_url: params['path'])
    render json: {rediect: link.first.url} and return unless link.empty?
    render json: {error: 'This short url is not valid'}
  end

  def create
    url = request.body.read
    link = Link.new(url: url)
    if link.save
      render json: {short_url: link.short_url}
    else
      render json: {errors: link.errors.messages}
    end
  end

end
