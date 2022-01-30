install:
	bundle install
lint:
	bundle exec rubocop
test:
	NODE_ENV=test bin/rails test

.PHONY: test
