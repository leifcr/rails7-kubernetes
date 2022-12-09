#!/bin/sh
bundle update
cp -f Gemfile* ./dev/
cp -f Gemfile* ./dev-mysql8/
cp -f Gemfile* ./dev-no-entrypoint/
cp -f Gemfile* ./mysql8-client/
# cd dev
# yarn upgrade
# cp yarn.lock ../dev-no-entrypoint/
# cp yarn.lock ../dev-mysql8/
# yarn outdated
# cd ..
bundle outdated --strict

# gc -m "Update gems"
