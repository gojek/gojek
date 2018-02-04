# GO-JEK Tech Team's Website Builder
[![CircleCI](https://circleci.com/gh/gojek/gojek/tree/master.svg?style=svg)](https://circleci.com/gh/gojek/gojek/tree/master)

## Description

[Middleman](https://middlemanapp.com/)-Powered Website Builder 👨🏻‍🏭⚡🕸🏛

[GO-JEK](https://github.com/gojek/gojek) generates content for
[GO-JEK GitHub Pages](https://github.com/gojek/gojek.github.io)

This is currently still a fork of https://github.com/gojek-engineering/gojek-engineering so please push changes to both.

## Building

Set up git@github.com:gojek-engineering/gojek-engineering.git as `origin`
Set up git@github.com:gojek/gojek.git as remote with name `gojek-github-io`


### Local Copy
```
  make clean
  make setup
  make install
  make serve

or just,
  make
```

### Publish

```
make publish # publishes only to gojekengineering.com; gojek.io publishing happens through circle-ci
```

## License

```
Copyright 2017, GO-JEK Tech Team (http://www.gojek.io)

```
