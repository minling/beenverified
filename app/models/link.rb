class Link < ApplicationRecord

  validates :url, presence: {message: 'Please enter a url'}, uniqueness: true, on: :create
  after_create :encode_url

  CHARS = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._~'
  SIZE = CHARS.length

  def encode_url
    number = id
    string = ''
    while number > 0
      string = CHARS[number % SIZE] + string
      number = (number / SIZE).floor
    end
    update(short_url: string)
  end

  def increment_access_count
    increment!(:access_count)
  end

end
