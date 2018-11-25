class LinksController < ApplicationController

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
