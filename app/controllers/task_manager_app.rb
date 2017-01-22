require_relative "../models/task"

class TaskManagerApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)
  enable :method_override

  get '/' do
    erb :dashboard
  end

  get '/tasks' do
    @tasks = Task.all
    erb :index
  end

  get '/tasks/new' do
    erb :new
  end

  post '/tasks' do
    task = Task.new(params[:task])
    task.save
    redirect "/tasks"
  end

  get '/tasks/:id' do
    @task = Task.find(params[:id])
    erb :show
  end

  get '/tasks/:id/edit' do
    @task = Task.find(params[:id])
    erb :edit
  end

  put '/tasks/:id' do
    @task = Task.find(params[:id])
    @task.update(params[:task])
    redirect "/tasks/#{params[:id]}"
  end
end
