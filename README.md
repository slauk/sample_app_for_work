# Ruby on Rails Tutorial  sample application

This is sample application for 
[*Ruby on Rails Tutorial: Learn Web Development with Rails*](https://railstutorial.org/)
(6th Edition)
by [Michael Hartl](https://www.michaelhartl.com/)

## License

All sourse code in the [*Ruby on Rails Tutorial: Learn Web Development with Rails*](https://railstutorial.org/) is available jointly under the MIT License and Beeware License. See [LICENSE.md](LICENSE.md) for more details.

## How to start the application

To get started with the app, clone the repo and install needed gems:
```
$ gem install bundler -v 2.2.17
$ bundle _2.2.17_ config set --local without 'production'
$ bundle _2.2.17_ install
```

Then migrate database:
```
$ rails db:migrate
```

Next, run the test suite to verify that everything is working correctly:
```
$ rails test
```

Finally, if the test suite passes, you'll be ready to run the application in a local server:
```
$ rails server
```

For more information look in 
[*Ruby on Rails Tutorial: Learn Web Development with Rails*](https://railstutorial.org/book )