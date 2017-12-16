SHELL := /usr/bin/env bash -e

GITHUB_PAGES_REPO := git@github.com:gojek/gojek.github.io.git

all: clean setup install serve

setup:
	rbenv install --skip-existing
	gem install bundler
	-git remote --verbose add upstream ${GITHUB_PAGES_REPO} || \
	 git remote --verbose set-url upstream ${GITHUB_PAGES_REPO}

clean:
	rm -rf ./build

install:
	bundle install --path vendor

serve:
	bundle exec middleman server

publish: clean
	bundle exec rake publish REMOTE_NAME=upstream BRANCH_NAME=master
