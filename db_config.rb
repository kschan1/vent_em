require 'active_record'

options = {
  adapter: 'postgresql',
  database: 'vent_em'
}

ActiveRecord::Base.establish_connection(options)
