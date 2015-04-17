require 'bundler'
Bundler.require()

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'todo'
)

require './models.todo.rb'

get '/' do
  erb :index
end

#get all todos
get '/api/todos' do
content_type :json
todos = Todo.all
todos.to_json
end

#specific todo
get '/api/todos/:id' do
content_type :json
todo = Todo.find(params[:id].to_i)
todo.to_json
end

#create a new todo
post '/api/todos' do
content_type :json
todo = Todo.create({params[:task], params[:complete], params[:date]})
todo.to_json
end

#update existing todo - put
put '/api/todos/:id' do
content_type :json
todo = Todo.update(id: params[:task])
todo.to_json
end

#update existing todo - patch
patch '/api/todos/:id' do
content_type :json
todo = Todo.update(id: params[:task])
todo.to_json
end

#delete an existing todo
delete '/api/todos/:id' do
content_type :json
todo = Todo.delete(params[:id].to_i)
end
