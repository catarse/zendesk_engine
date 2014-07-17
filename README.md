# ZendeskEngine [ ![Codeship Status for catarse/zendesk_engine](https://codeship.io/projects/9a3ec7c0-f00e-0131-0889-62f1bdfbd872/status)](https://codeship.io/projects/27276) [![Code Climate](https://codeclimate.com/github/catarse/zendesk_engine.png)](https://codeclimate.com/github/catarse/zendesk_engine)

## Install and configure
Just add to your Gemfile:

    gem 'zendesk_engine'

And create an initializer in ```config/initializers/zendesk_engine.rb``` with your Zendesk credentials:

    ZendeskEngine.configure do |config|
      config.url   = 'https://foocompany.zendesk.com/api/v2'
      config.user  = 'myzendeskagent@foocompany.com'
      config.token = 'my zendesk token found in API config'
    end

## Mount the routes
Add to your ```config/routes.rb```:
```ruby
MyApplication::Application.routes.draw do
  mount ZendeskEngine::Engine => "/"
end
```

This will add the /tickets resources route to the path you've chosen as mouting point ("/" in the example above).

## Make requests
After this you can post tickets to /tickets and they will be relayed to the Zendesk API via the zendesk_api gem ;)
The parameters to ticket creation should be:
```ruby
{
  user: {
    email: 'foo@bar.com',
    name: 'Foo Bar'
  },
  ticket: {
    subject: 'Awesome ticket',
    comment: {value: 'This is a ticket just to show a cool example'},
    priority: 'urgent'
  }
}
```
The response will be a json with the created ticket.

This project rocks and uses MIT-LICENSE.
