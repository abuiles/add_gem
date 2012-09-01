# AddGem

Command-line tool to append new gems to your Gemfile with pessimistic version constrain.

## Problem
When adding a new gem to my Gemfile I found myself visiting
http://rubygems.org/gems/GEM_NAME and checking the latest version.

I like to use pessimistic version constrain to avoid headaches. I have
seen projects getting broken because major version updates, and people
wasting their time trying to figure it out what it was.

I built this tool which receives the name of the gem and then adds a
new entry to your Gemfile including the version with the pessimistic
operator (`~>`).

    $ cat Gemfile
    source 'https://rubygems.org'

    $ add_gem rails
    $ Added gem "rails", "~> 3.2.8" to your Gemfile.

    $ cat Gemfile
    source 'https://rubygems.org'
    gem "rails", "~> 3.2.8"

What's wrong with `gem search rails -r` you might be thinking? the
answer is nothing, but why do something in more than one step when it
can be done in one. :)


## Usage

Install with rubygems:

    gem install add_gem

And then execute on your working directory:

    $ add_gem rails
    $ Added gem "rails", "~> 3.2.8" to your Gemfile.


## TODO

- Take as parameter a group and then add the gem under the given group.
