SHELL := /usr/bin/env bash -e

GITHUB_PAGES_REPO := git@github.com:gojek/gojek.github.io.git

all: clean setup install serve

setup:
	rbenv install --skip-existing
	gem install bundler
	-git remote --verbose add gojek-github-io ${GITHUB_PAGES_REPO} || \
	 git remote --verbose set-url gojek-github-io ${GITHUB_PAGES_REPO}

clean:
	rm -rf ./build

install:
	bundle install --path vendor

serve:
	bundle exec middleman server

.PHONY: build
build:
	bundle exec middleman build

publish: clean
	bundle exec rake publish

gojek-github-io-publish:
	GOJEK_CNAME="www.gojek.io" bundle exec rake publish REMOTE_NAME=gojek-github-io BRANCH_NAME=master
