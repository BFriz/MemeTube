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

get '/videos/new' do
  erb :new
end

get '/videos/upload' do
  sql = 'select * from videos'
  @videos = run_sql(sql)
  erb :upload
end

post '/videos/upload' do
  sql = "insert into videos (title, url, genre) values ('#{params[:title]}', '#{params[:url]}', '#{params[:genre]}')"
  run_sql(sql)
  redirect to ('/')
end

# delete '/videos' do
# redirect to ('/videos')
# end








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
