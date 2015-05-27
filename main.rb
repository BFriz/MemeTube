require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require 'pry-byebug'

get '/' do
  redirect to ('/videos')
end

get '/videos' do
  sql = 'select * from videos'
  @videos = run_sql(sql)
  erb :videos
end

private
def run_sql(sql)
  conn = PG.connect(dbname: 'memetube' , host: 'localhost')
  begin
    result = conn.exec(sql)
  ensure
    conn.close
  end
  result
end
