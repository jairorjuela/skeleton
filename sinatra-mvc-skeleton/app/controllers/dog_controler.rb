get '/' do
  erb :home
end

#CROD http://guides.rubyonrails.org/routing.html

#index
get '/dogs' do
  @dogs = Dog.all #Esta linea nos va a direccionar al modelo que es donde estan los datos
  erb :"dogs/index"
end


#GET NEW

get '/dogs/new' do
  erb :"dogs/new" #crea el formulario para que el usuario cree el nuevo perro
end


#GET SHOW el show debe ir despues del new para que sinatra no lo queme de primeras
get '/dogs/:id' do
  @dog = Dog.find(params[:id]) #en esta linea estoy buscando el id en la base de datos
  erb :"dogs/show"   #este bloque me va a permitir ver un perro, lo llamo con el id  y en dogs se ebe crea el show.erb
end




#POST CREATE

post 'dogs/' do
  dog = Dog.new(name: params[:name], age: params[:age]) #esta linea crea un perro, el params es el valor
                                                      #que se ingresa en el formulario con new es para geberar el error
if dog.save
  redirect "/dogs/#{dog.id}" #esta linea me direcciona a show para que me muestre el que cree, con
                              #la variable creada dog la itera y busca el dog por id para mostrarlo
else
  @errors = @dog.errors.full_messages
  erb :"dogs/new"
end

end

#GET edit|
get '/dogss/:id/edit' do
  @dog = Dog.find(params[:id]) #esta linea busca el perro para llenar el formulario de edicion
  erb :"dogs/edit"
end

#PATCH Update
patch '/dogs/:id' do
  @dog = Dog.find(params[:id])
  if @dog.update(name: params[:name], age: params[:age])
  redirect "/dogs/#{dog.id}"
else
  @errors = @dog.errors.full_messages #este bloque es para crear un error para el usuario cuando quiera crear un elemento y pase algo mal
  erb :"dogs/edit" #se coloca el arroa para que
end
end

#DElETE
delete "/dogs/:id" do
  dog = Dog.find(params[:id])
  dog.destroy
  redirect "/dogs"
end
