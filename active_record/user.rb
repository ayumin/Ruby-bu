require 'rubygems'
require 'active_record'

#ActiveRecord::Base.establish_connection(
#  :adapter => 'sqlite3',
#  :dbfile => 'example.db'
#)

class User < ActiveRecord::Base
end
User.establish_connection :adapter => 'sqlite3', :dbfile => 'example.db'
u = User.new
u.name = "ayumu AIZAWA"
u.celphone = "080-3095-8795"
u.save
p User.find(:all)