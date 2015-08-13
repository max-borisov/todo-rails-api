var projects = [
  {
    id: 1,
    title: 'Project 1',
    tasks: [
      { id: 1, description: 'desc 1 1', completed: false },
      { id: 2, description: 'desc 1 2', completed: true },
    ]
  },

  {
    id: 2,
    title: 'Project 2',
    tasks: [
      { id: 1, description: 'desc 2 1', completed: true },
    ]
  },
];

var app = angular.module('todo', ['directives']);