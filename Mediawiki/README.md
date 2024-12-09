# Docker
1. Primero que todo, nos descargaremos el repositorio de GitHub, seguidamente lo extraeremos en una carpeta.

2. Dentro de esa carpeta nos iremos al siguiente ruta (puede ser desde el cmd o desde el Visual Studio Code): DockerConfiguration/Mediawiki

4. Ejecutamos docker-compose build --no-cache .

5. Ejecutamos docker-compose up -d

## Instalación
1. En nuestro navegador colocamos: http://localhost:89 y damos clic en donde esté subrayado con azul, seleccionamos nuestro idioma y le damos a coninuar

2. Bajamos un poco y le volvemos a dar a continuar

3. Rellenamos lo que nos pide (desde la opción de MariaDB) con los datos que se encuentran en nuestro .env. En el apartado de "Servidor de la base de datos" ponemos "mysqlmw". Seguidamente le damos a Continuar.

4. Ahora le damos a la casilla y después a continuar

5. En este apartado nos dirá que tenemos que agregar varias cosas, para ello rellenamos todo (solamente se editará lo que se escriba a continuación): Nombre de la Wiki "Ale", nombre de usuario: mimw, Contraseñas: 4Vientosss, seleccionamos la opción "Ya me aburrí. Tan solo instala la Wiki" y a continuar.

6. Y en Instalar le damos a Continuar, en el sigueinte apartado (donde dice todas las configuraciones que ha hecho) le volvemos a dar a continuar.

7. Nos felicitará por haber hecho la instalación y nos descargará un archivo el cual se trendrá que mover al docker 

8. Se nos descargara un archivo de configuracion, este lo tendremos que mover al contenedor de docker

9. En la carpeta donde tenemos el archivo descargado, ejecutamos el comando (en el cmd): docker cp LocalSettings.php mediawiki_www:/var/www/html

10. En el navegador volvemos a colocar localhost:89 y ya estaría!


## Base de datos
1. Nos descargamos HeidiSQL

2. Lo abrimos y le damos a Nueva 

3. Ponemos en el apartado del puerto: 3310

4. Y utilizamos la contraseña que aparece en nuestro .env y su usuario