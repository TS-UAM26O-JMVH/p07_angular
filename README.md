# Práctica 7: Pruebas Automatizadas (Unitarias, Integración y E2E), Accesibilidad y Dockerización en Angular

Proyecto desarrollado como parte de las actividades académicas de Ingeniería de Software / Tecnologías para la Web, enfocado en la implementación de pruebas de calidad de software y despliegue contenedorizado.

---

## 🛠️ Tecnologías y Herramientas Utilizadas

* **Framework:** Angular 
* **Pruebas unitarias, de componentes, de integración, de contrato, E2E y de Accesibilidad.**
* **Contenedorización:** Docker (Alpine Node.js y Nginx)
* **API Externa / Backend:** API Académica Remota (`http://developer.jquiroz.net:3005`)

---
## 📂 Estructura de la Práctica

El desarrollo de la práctica se divide en las siguientes etapas principales:

1. **Configuración del entorno de pruebas** y resolución de dependencias con el backend remoto.
2. **Pruebas Unitarias** con Vitest para componentes y servicios.
3. **Pruebas E2E y de Accesibilidad** automatizadas mediante Cypress.
4. **Dockerización de la aplicación** utilizando una arquitectura multi-etapa (*multi-stage build*) con Node y Nginx.

---
## 🚀 Guía de Ejecución Local

### 1. Instalación de Dependencias
Si clonas o configuras el proyecto por primera vez, instala las dependencias (utilizando la bandera de compatibilidad si manejas versiones recientes de Cypress):
```bash
npm install --legacy-peer-deps
```
### 2. Ejecución de Pruebas 
#### 2.1 Pruebas Unitarias
```bash
ng test 
```
#### 2.2 Pruebas de componentes
```bash
    ng test --watch=false
```
#### 2.3 pruebas de contrato
```bash
    ng test --watch=false
```
#### 2.4 Pruebas de contrato
```bash
    ng test --watch=false
```
#### 2.5 Pruebas E2E:
> Modo Interactivo (GUI):
>> alzamos el sistema:
```bash
    ng serve
```
>  Modo Headless (Terminal / CI):
>> ejecucion de prueba:
```bash
    npx cypress open
```
#### 2.6 pruebas de accesibilidad:
```bash
    npx cypress run --spec "cypress/e2e/accesibilidad.cy.ts" --browser electron
```
#### 2.7 prueba de interceptores HTTP
```bash
    ng test --watch=false
```
#### 2.8 Prueba de servicios compartidos
```bash
    ng test --watch=false
```
---
## 🐳 Despliegue con Docker
### 1. Construcción de la Imagen Docker
Genera la imagen de producción con el nombre etiquetado en minúsculas:
```bash
docker build -t primeraaplicacion-conexionapi .
```
### 2. Ejecución del Contenedor
Levanta el contenedor exponiéndolo en el puerto 4201 de tu máquina local:
```bash
docker run -d -p 4201:80 --name primeraaplicacion-app primeraaplicacion-conexionapi
```
Una vez ejecutado, puedes acceder a la aplicación desplegada desde tu navegador en:http://localhost:4201
--- 
## 👤 Autor
Juan Manuel Valentin