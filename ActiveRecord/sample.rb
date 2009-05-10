#!/usr/bin/ruby
require 'rubygems'
require 'active_record'
ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :dbfile => 'example.db'
)