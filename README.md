## How to setup project

- Clone this repo
-  In your terminal, `cd` into the cloned repo. 
- Run `bundle install` then create and migrate your local database i.e `rails db:create db:migrate`
- Start sidekiq to listen to the `responses` queue with `bundle exec sidekiq -q responses` in your terminal.
  You can check your local instance of sidekiq at `http://localhost:3000/sidekiq`
- In another terminal tab, start your rails server with `bundle exec rails s`
- To run tests, run `bundle exec rspec`


## How to run this project

- Follow this [link](https://cloud.google.com/ruby/getting-started/using-pub-sub) in order to set up a project on GCP and enable the Pub/Sub API for the project. 
  The link also has instructions to setting up a topic and subscription on GCP.
- Once that is setup, create a `.env` file with the following credentials.
```
  GOOGLE_APPLICATION_CREDENTIALS="path/to/service-account-file.json"
  GOOGLE_CLOUD_PROJECT_ID="your_gcp_project_id"
```
- In your terminal, run `rails c`
- Load the PubSub modue into the console with `load "#{Rails.root}/lib/modules/pub_sub/pub_sub.rb"`
- To publish a message, run `PubSub.publish('topic_you_created_in_gcp', 'message')`
- To subscribe to messages run `PubSub.subscribe(subscription_id_in_gcp_console)`

## Clean up (Optional): 
  - Follow the clean up section on this [link](https://cloud.google.com/ruby/getting-started/using-pub-sub) to delete topics and subscriptions on GCP.