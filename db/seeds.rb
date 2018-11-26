# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Link.destroy_all

top_list = ["https://Facebook.com", "https://Twitter.com", "https://Google.com", "https://Youtube.com", "https://Instagram.com", "https://Linkedin.com", "https://Wordpress.org", "https://Pinterest.com", "https://Wikipedia.org", "https://Wordpress.com", "https://Blogspot.com", "https://Apple.com", "https://Adobe.com", "https://Tumblr.com", "https://Youtu.be", "https://Amazon.com", "https://Goo.gl", "https://Vimeo.com", "https://Flickr.com", "https://Microsoft.com", "https://Yahoo.com", "https://Godaddy.com", "https://Qq.com", "https://Bit.ly", "https://Vk.com", "https://Reddit.com", "https://W3.org", "https://Baidu.com", "https://Nytimes.com", "https://T.co", "https://Europa.eu", "https://Buydomains.com", "https://Wp.com", "https://Statcounter.com", "https://Miitbeian.gov.cn", "https://Jimdo.com", "https://Blogger.com", "https://Github.com", "https://Weebly.com", "https://Soundcloud.com", "https://Mozilla.org", "https://Bbc.co.uk", "https://Yandex.ru", "https://Myspace.com", "https://Google.de", "https://Addthis.com", "https://Nih.gov", "https://Theguardian.com", "https://Google.co.jp", "https://Cnn.com", "https://Stumbleupon.com", "https://Gravatar.com", "https://Digg.com", "https://Addtoany.com", "https://Creativecommons.org", "https://Paypal.com", "https://Yelp.com", "https://Imdb.com", "https://Huffingtonpost.com", "https://Feedburner.com", "https://Issuu.com", "https://Wixsite.com", "https://Wix.com", "https://Dropbox.com", "https://Forbes.com", "https://Miibeian.gov.cn", "https://Amazonaws.com", "https://Google.co.uk", "https://Washingtonpost.com", "https://Bluehost.com", "https://Etsy.com", "https://Go.com", "https://Msn.com", "https://Wsj.com", "https://Ameblo.jp", "https://Archive.org", "https://Slideshare.net", "https://E-recht24.de", "https://Weibo.com", "https://Fc2.com", "https://Eventbrite.com", "https://Parallels.com", "https://Doubleclick.net", "https://Mail.ru", "https://Sourceforge.net", "https://Amazon.co.uk", "https://Telegraph.co.uk", "https://Ebay.com", "https://Amzn.to", "https://Livejournal.com", "https://51.la", "https://Free.fr", "https://Yahoo.co.jp", "https://Dailymail.co.uk", "https://Reuters.com", "https://Taobao.com", "https://Wikimedia.org", "https://Amazon.de", "https://Typepad.com", "https://Hatena.ne.jp", "https://Beenverified.com"]


top_list.each do |link| 
  Link.create!(url: link)
end
