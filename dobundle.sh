#!/bin/sh
rm -rf bundle
bundle install
bundle package
bundle install --standalone --local
