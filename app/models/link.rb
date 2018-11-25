class Link < ApplicationRecord

  validates :url, presence: {message: 'Please enter a url'}, uniqueness: true
  after_create :encode_url

  CHARS = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
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

end
