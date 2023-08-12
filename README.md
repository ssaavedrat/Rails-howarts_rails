# Desafío - Despliegue de una Aplicación en Internet utilizando Heroku

En este desafío, se aplican conocimientos para crear y desplegar una aplicación que muestra personajes de HaPo junto con su ubicación y casa en la que pertenecen.

## Howarts Rails - Aplicación de Personajes de HaPo

Este proyecto tiene como objetivo desarrollar una aplicación web que permita a los usuarios explorar información sobre los personajes de la famosa saga de magos. La aplicación mostrará los detalles clave de cada personaje, incluido su nombre, locación, casa y hechizo.

## Pasos

### Creación de la Aplicación

1. Crea una nueva aplicación Rails:

   ```bash
   rails new howarts-rails --database=postgresql
   ```

2. Se instalan las gemas `faker` y `rails_live_reload`:

   ```bash
   bundle add faker
   bundle add rails_live_reload
   ```

3. Se crea la base de datos:

   ```bash
   rails db:create
   ```

### Generación de Modelos y Datos

1. Genera el modelo `Character` con los campos `name`, `location`, `house` y `spell`:

   ```bash
   rails generate model Character name:string location:string house:string spell:string
   ```

2. Carga los datos utilizando Faker y el archivo `seed.rb`:

    Abre el archivo `db/seeds.rb` y agrega el siguiente código:

    ```ruby
    puts('Creating wizards...')

    10.times do
    Character.create(
        name: Faker::Movies::HarryPotter.character,
        location: Faker::Movies::HarryPotter.location,
        house: Faker::Movies::HarryPotter.house,
        spell: Faker::Movies::HarryPotter.spell
    )
    end
    ```

   Luego, ejecuta:

   ```bash
   rails db:seed
   ```

### Controlador y Vistas

1. Genera el controlador `Pages` con la vista `index`:

   ```bash
   rails generate controller Pages index
   ```

2. Se edita el archivo `app/controllers/pages_controller.rb` y modifica la acción `index` para obtener los personajes de la base de datos y pasarlos a la vista.

3. Crea la vista `index.html.erb` en `app/views/pages` y muestra la información de los personajes.

4. Agrega estilos a la vista incluyendo Bootstrap en `app/views/layouts/application.html.erb`.

### Ruta Raíz

1. Establece la ruta raíz de la aplicación:

   Abre el archivo `config/routes.rb` y agrega:

   ```ruby
   root 'pages#index'
   ```

### Despliegue en Heroku

1. Crea una cuenta en Heroku si aún no tienes una.

2. Instala el cliente de Heroku en tu máquina local.

3. Inicia sesión en Heroku desde la terminal:

   ```bash
   heroku login
   ```

4. Crea una nueva aplicación en Heroku:

   ```bash
   heroku create howarts-rails
   ```

5. Despliega la aplicación en Heroku:

   ```bash
   git push heroku main
   ```

6. Ejecuta las migraciones en Heroku:

   ```bash
   heroku run rails db:migrate
   ```

7. Abre la aplicación en tu navegador:

   ```bash
   heroku open
   ```

¡Felicitaciones! Si has seguido todos los pasos, deberías ver la aplicación desplegada en Heroku.

## Contribución

Este proyecto se proporciona como un recurso educativo y de aprendizaje.
