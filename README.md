Website is built with [Middleman](http://www.middlemanapp.com), an open source static site generator.
Feel free to take a look round.

Please visit the website here : (http://gojekengineering.com)

## Usage

To install dependencies: 

```
$ bundle install
```
To run development server:

```
$ bundle exec middleman server
```

To build locally:
```
$ bundle exec rake build
```

To deploy on gh-pages:
```
$ bundle exec rake publish
```

If you run into issuse publishing:
```
$ rm -rf build
$ bundle exec rake publish
```
