# README

## Description
This application captures full urls and creates urls of the shortest possible length.

## Setup

Please set up your environment with these requirements:

* Ruby version 2.5.3

* Rails 5.2.1

* Run these to set up the database and seeds

```
rake db:create
rake db:migrate
rake db:seed
```

=======
## Algorithm
The shortest link possible for any url, has a size of 1 character. The available characters for use is:

character list: `abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._~`

These characters are safe to be used in a url without encoding. Generally, the longer the length of this set, the larger set of shorter links that could be generated. This set contains 66 characters.

[Here is a link to read about URI Syntax](https://tools.ietf.org/html/rfc3986#section-2.3)

The shortest url length would be the first 65 records to be saved, resulting in a short link of 1, which accounts for every character in the character list, except for index of 0.

```ruby
<Link id: 1, url: "https://Facebook.com", 
short_url: "b", 
title: nil, 
access_count: 0, 
created_at: "2018-11-26 02:10:45", 
updated_at: "2018-11-26 02:10:45">
```
The first record would have a short_url of 1 character, `http://localhost:3000/b`. 

After the first 65 records are saved, on the 66th url, it would contain short url length of 2. 

```
<Link id: 66, url: "https://Miibeian.gov.cn", 
short_url: "ab", 
title: nil, 
access_count: 0, 
created_at: "2018-11-26 02:14:51", 
updated_at: "2018-11-26 02:14:51">
```

Once it has used up the first 65 characters, it will use the character list again. So for IDs larger than 66, it will go through a while loop to add to the short_url. 

Example with Record `66` with comments on the `first iteration // second iteration`:

```ruby
def encode_url
    number = id  # 66  // 1
    string = ''
    while number > 0
      string = CHARS[number % SIZE] + string  # string == 'a' // string == 'ab'
      number = (number / SIZE).floor # number = 1 // number = 0
    end
    update(short_url: string)
end
```
=======
## Commands
There are 3 endpoints you can use:

###To create a shortened link:

`curl -X POST -d "https://google.com" http://localhost:3000/url.json`

This returns json object with the short url.

```
{"short_url":"e"}
```

If it's already taken, it will return an error:

```
 {"errors":{"url":["has already been taken"]}}
```
 
###To access the link you just created:
 
`curl  http://localhost:3000/c`

This will return the link to be redirected to.

```
{"rediect":"https://google.com"}
```

###To get the top 100 links:
`curl  http://localhost:3000/top.json`

Sample json results:

```
{"top_100":[
  {"url":"https://beenverified.com","short_url":"d","title":null,"access_count":5},
  {"url":"https://etsy.com","short_url":"c","title":null,"access_count":2},
  {"url":"https://google.com","short_url":"b","title":null,"access_count":1}
]...}
```