# utiliza un proceso de construcción en dos etapas. En la primera etapa se instalan las
# dependencias y se compila la aplicación Angular. En la segunda etapa se copia únicamente el resultado del
# build hacia una imagen de Nginx, descartando todo lo demás para reducir el tamaño final de la imagen

# Etapa 1: build de la aplicacion Angular
FROM node:22-alpine AS build

WORKDIR /app

COPY package*.json ./
RUN npm install --legacy-peer-deps

COPY . .
RUN npm run build

# Etapa 2: servir con Nginx
FROM nginx:alpine

# Copia el build de Angular
COPY --from=build /app/dist/primeraAplicacion/browser /usr/share/nginx/html

# Copia la configuracion de Nginx con proxy
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
