# README

Primero buildea la imagen
```docker-compose build```
Despues levanta la imagen
```docker-compose up```
Luego creas la base de datos desde rails, abres otra consola y corres
```docker-compose run web bundle exec rails db:create```
Corres las migraciones
```docker-compose run web bundle exec rails db:migrate```

## ESTO ES SOLO PARA CARGAR LOS CODIGOS PROMOCIONALES EN LA BASE DE DATOS
```docker-compose run web bundle exec rails db:seed```

Para crear un usuario ingresas en la consola de rails con 
```docker-compose run web bundle exec rails c```

Luego creas el usuario con

```User.create(email: "el email", password: "la password, username: "el username", name: "el nombre", last_name: "el apellido", branch: "la sucursal")```

Luego para ingresar al sistema ingresas con username y la contraseña
