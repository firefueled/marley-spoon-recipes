# README

This app lists and details recipes from Marley Spoon's Contentful API. It uses the contentful SDK to facilitate the requests.

* Ruby version
It's based on ruby 2.5.1 and rails 5.2.2.

* Notable dependencies
contentful provides the Contentful SDK
pure-css provides a simple grid-based css solution

* Configuration
Make sure bundler is installed with
`gem bundler`

Install the dependencies with
`bundle install`

Enter the Contenful credentials (api_token and space_id) into the Rails credentials database by running:
```
rails credentials:edit
```

They should be formated like so:
```
contentful:
    token: aaaaaaaaaaaabbbbbbbbbbbbbccccccccccddddddddddddeeeeeeeeeffffffff
    space_id: aaabbbcccddd
```

* Database
No need

