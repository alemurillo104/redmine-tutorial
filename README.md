# Módulo : Pruebas de Software

## Grupo 2

## Integrantes

- Alejandra Murillo
- Willyams Yujra

## Tutorial de Redmine

URL del proyecto: [https://github.com/alemurillo104/redmine-tutorial](https://github.com/alemurillo104/redmine-tutorial)

## Pre Requisitos del tutorial

- **Proyecto Biblioteca** ingrese al siguiente link  [https://github.com/yracnet/uagrm-m4-junit-course](https://github.com/yracnet/uagrm-m4-junit-course) y siga las instrucciones para instalar el proyecto ejemplo. 

## Requisitos para instalar Redmine en Ubuntu
Para el presente proyecto, se requiere disponer de una maquina virtual en Linux (Ubuntu)

## Instalación de Redmine en Ubuntu

Dentro de presente repositorio se encuentra el archivo [install-redmine.sh](**install-redmine.sh**) el cual contiene todas las instrucciones detalladas para instalar Redmine y sus programas o paquetes que se requieren previamente.

> **NOTA**
> Para la instalacion en Windows, ejecute el script [/install-redmine-windows.ps1](install-redmine-windows.ps1), equibalente al escript de linux.

Ejecute el contenido del script en la maquina donde desee instalar **Redmin** o siga los siguientes pasos:

```sh
cd /opt
wget https://raw.githubusercontent.com/alemurillo104/redmine-tutorial/main/install-redmine.sh
chmod +x install-redmine.sh
./install-redmine.sh
```

> **NOTA**
> Este comando instalará las dependencias necesarias del proyecto. Se requiere una conexión a Internet.

### Pasos ejecutados por el Script

- **Instalacion de Paquetes necesarios**, instalamos los paquetetes necesarios en el SO Linux
- **Instalar ruby-install**, instalamos el utilitario _ruby-install_, para poder instalar la version de Ruby a utilizar
- **Instalar Ruby-3.1.4**, Redmine 5 requeire la version 3.1.4 de ruby. 
- **Instalar Redmine 5.0.5**
  - Configurar SQLite3 como Base de Datos
  - Descargar gemas
  - Levantar servidor

### Configuración de Ngrok 
Una vez se ejecute el script mencionado anteriormente, para obtener una url publica, utilizaremos la herramienta ngrok, para exponer los servicios locales de la VM a Internet.
Ejecutamos los siguientes comandos:
-  Autenticación de Ngrok: reemplazar **your_auth_token** por el token obtenido en tu cuenta en ngrok.
  
```bash
ngrok authtoken _your_auth_token_
```
> **NOTA**
> Para obtener su token, ingrese a la plataforma de [Ngrok](https://ngrok.com/) e inicie sesión con su usuario.

- Ejecutar Ngrok en el puerto deseado, ejm: puerto 3000.

```bash
ngrok http 3000
```

## Configuracion de Redmin
Vea el video en [Video tutoral](http://youtube/ddd)
### Registro de Usuarios
### Creacion de un proyecto
### Creacion de Flujo

## Reportar un Ticket en Redmin
### Sitio Web
### Plugin Netbeans
- Instalar el plugin **redminenb-1.12.1-SNAPSHOT.nbm**

## Obtener un Reporte de Tickets en Redmin


### Screenshots
(Aún se deben añadir)
