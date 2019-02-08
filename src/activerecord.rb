require 'sqlite3'
require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: :sqlite3,
  database: 'dd.db'
)

class InitSchema < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :password
    end
  end

  def self.down
    drop_table :users
  end
end

class User < ActiveRecord::Base
  self.table_name = 'users'
end

begin
  if !ActiveRecord::Base.connection.table_exists? 'users'
    InitSchema.migrate(:up)
  end

  # User.create(name: '', password: '')
  p User.all
  InitSchema.migrate(:down)

rescue => e
  puts e.message
end
