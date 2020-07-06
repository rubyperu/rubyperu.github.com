---
layout: blog
title: Resumen del meetup de Julio
author: Daniel Peñaloza
---

¿Te perdiste el meetup de Julio de RubyPerú? No te preocupes, te tenemos cubierto. Prepárate porque tenemos para ti muchos detalles en este resumen.

## Primera charla: StimulusJS

[Julio Navarro](https://twitter.com/JulioNavr) nos habló de [StimulusJS](https://github.com/stimulusjs/stimulus), un framework de JavaScript que te permite agregar interactividad a tus elementos HTML.
Este tema surgió de [un tweet de DHH](https://twitter.com/dhh/status/1275901955995385856) (el creador de Rails) en el que hablaba de que usaron Stimulus como parte del stack de [HEY](https://hey.com).

Stimulus, es un framework pequeño que no busca manejar toda la lógica de tu front-end. Sino que sirve más como un reemplazo de vainilla JS o jQuery.

![](https://media.giphy.com/media/3o7abKhOpu0NwenH3O/source.gif)

La ventaja es que, al solo agregar eventos a tu HTML, te permite seguir utilizando el motor de plantillas de Ruby on Rails. Y, al tener una curva de aprendizaje pequeña, te permite concentrarte más en la lógica de negocio.

![](https://media.giphy.com/media/efJ3wU9Z8SLdUnpUem/giphy.gif)

Stimulus junto con Rails puede que no nos otorgue la mejor experiencia para el usuario, pero hace que los desarrolladores sean mucho más productivos.

![](https://media.giphy.com/media/xr7GE8l07Zw2Y/giphy.gif)

Si quieres jugar con Stimulus, aca hay una guía para poder empezar 🙂
[https://stimulusjs.org/handbook/introduction](https://stimulusjs.org/handbook/introduction)

Aca te dejamos la [presentación](https://drive.google.com/file/d/1zRxHHCPDKzvZ3-8BsEIPA8ksuSMY8-_8/view?usp=sharing) si es que se te paso algo.

## Segunda charla: Sinatra

[Diego Torres](https://twitter.com/diegotc86) nos dio una charla de [Sinatra](https://github.com/sinatra/sinatra), un DSL para crear aplicaciones con el mínimo esfuerzo.

Crear una aplicación web con Sinatra es bastante rápido. Solo se instala la gema y se utiliza el método `get` para que responda al request de la ruta `'/'`. Y con eso ya tienes tu primera aplicación con sinatra.

```ruby
# myapp.rb
require 'sinatra'

get '/' do
  'Hello world!'
end
```

Instala la gema:

```sh
gem install sinatra
```

Y corres la aplicación con:

```sh
ruby myapp.rb
```

Así como hay un método `get`, existe un método para todos los verbos HTTP.

```ruby
get '/' do
  .. show something ..
end

post '/' do
  .. create something ..
end

put '/' do
  .. replace something ..
end

patch '/' do
  .. modify something ..
end

delete '/' do
  .. annihilate something ..
end
```

Además te permite utilizar los nombres de las rutas como parámetros.

```ruby
get '/hello/:name' do
  # matches "GET /hello/foo" and "GET /hello/bar"
  # params['name'] is 'foo' or 'bar'
  "Hello #{params['name']}!"
end
```

E incluso, obtener los parámetros de la query si los necesitas.

```ruby
get '/posts' do
  # matches "GET /posts?title=foo&author=bar"
  title = params['title']
  author = params['author']
  # uses title and author variables; query is optional to the /posts route
end
```

Es lo suficientemente flexible para trabajar junto con ERB.

```ruby
get '/' do
  erb :index
end
```

Es bastante útil cuando tienes proyectos pequeños, o cuando quieres sacar algo rápido.

![](https://media.giphy.com/media/toXKzaJP3WIgM/giphy.gif)

Si quieres probar como funciona Sinatra [acá](http://sinatrarb.com/intro.html) puedes comenzar.

Aquí te dejamos la [presentación](https://slides.com/diegotc86/sinatra-tutorial) de Diego.

Y no te olvides que si quieres aportar con una charla, puedes apuntarte mediante este [form](/cfp). 🙂

Los esperamos!

![](https://media.giphy.com/media/hmVVRM1uV7vYA/source.gif)