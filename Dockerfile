####
FROM node:10.16.0-alpine

# Crea directorio de trabajo
RUN mkdir -p /opt/app

#Se establece el directorio de trabajo
WORKDIR /opt/app

# Instala los paquetes existentes del package.json
COPY package.json .
RUN npm install --quiet

# Instalacion de nodemon en Global
RUN npm install -g --quiet

#Copia la app
COPY . .

# Expone la app en el puerto 8000
EXPOSE 8000

#Inicia la aplicacion al iniciar al contenedor
CMD nodemon -L --watch . index.js