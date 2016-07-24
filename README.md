Rails API for Todo app
===

[![Build Status](https://travis-ci.org/max-borisov/todo-rails-api.svg?branch=master)](https://travis-ci.org/max-borisov/todo-rails-api) [![Code Climate](https://codeclimate.com/github/max-borisov/todo-rails-api/badges/gpa.svg)](https://codeclimate.com/github/max-borisov/todo-rails-api) [![Test Coverage](https://codeclimate.com/github/max-borisov/todo-rails-api/badges/coverage.svg)](https://codeclimate.com/github/max-borisov/todo-rails-api/coverage)

## [Demo on heroku](https://rails-api-todo-app.herokuapp.com/api/projects)

## Description
Todo app based on Rails framework.

It's a demo so it does not have a registration section.

### Functionality
* Create/delete/rename projects
* Create/delete/update/sort project tasks

## Reqirements
* Ruby 2.2.2
* Rails 4.2.3

## Installation
* Clone the repo
* Run `rake db:migrate`
* Run `rake db:seed` to fill in the database
* Start the server `rails s -p 9595`
* Go to [http://localhost:9595](http://localhost:9595) and have a fun

## Testing
* Run `rspec spec/`

