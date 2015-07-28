Simple ToDo lists
===

[![Build Status](https://travis-ci.org/max-borisov/rails-todo.svg)](https://travis-ci.org/max-borisov/rails-todo) [![Code Climate](https://codeclimate.com/github/max-borisov/rails-todo/badges/gpa.svg)](https://codeclimate.com/github/max-borisov/rails-todo) [![Test Coverage](https://codeclimate.com/github/max-borisov/rails-todo/badges/coverage.svg)](https://codeclimate.com/github/max-borisov/rails-todo/coverage)

## [Demo on heroku](https://rails-simple-todo.herokuapp.com/)

## Description
Simple to-do lists app based on Rails framework. 
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
* Run `rspec spec/models`
* Run `rspec spec/controllers`
* View tests will be done soon

---

![Simple ToDo lists preview](https://github.com/max-borisov/rails-todo/blob/master/app_preview.png)
