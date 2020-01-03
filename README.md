# task-manager

This is an APP for manage tasks

## Setup

Just run the bin setup:

```bash
  bin/setup
```
or

```bash
  bundle install
  yarn install --check-files
```

Now you should create db, run the migrates and seeds:

```bash
  rails db:create db:migrate db:seed
```

To run the app:

```bash
  rails server
```

## Pending
- Install rspec
- Create tests
- config serializers