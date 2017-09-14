ccdatafetcher
============================================
Cryptocurrency API Data Fetcher

Worker
-------
### Run

```sh
rvm install ruby-2.4.0
rvm use ruby-2.4.0
bundle install
rake db:create db:migrate
ruby script/delayed_job run
```

Tests
-------
### Run

```sh
bundle exec rspec
```

Enqueuer (for dev testing)
-------
### Run

```sh
./script/simple_enqueuer
```

