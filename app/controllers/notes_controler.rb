get '/' do
  erb :home
end

#index
get '/notes' do
  @notes = Note.all
  erb :"notes/index"
end

#new
get '/notes/new' do
 erb :"notes/new"
end

#show
get '/notes/:id' do
  @note = Note.find(params[:id])
  erb :"notes/show"
end

#Create
post '/notes' do
  @note = Note.new(name_student: params[:name_student], student: params[:student])
  if @note.save
    redirect "/notes/#{@note.id}"
  else
    @errors = @note.errors.full_messages
    erb :"notes/new"
  end
end

#Edit
get '/notes/:id/edit' do
  @note = Note.find(params[:id])
  erb :"/notes/edit"
end

#UPDATE
patch '/notes/:id' do
  @note = Note.find(params[:id])
  if @note.update(name_student: params[:name_student], student: params[:student])
    redirect "/notes/#{@note.id}"
  else
    @errors = @note.errors.full_messages
    erb :"notes/edit"
  end
end

#Delete
delete '/notes/:id' do
  note = Note.find(params[:id])
  note.destroy
  redirect "/notes"
end
