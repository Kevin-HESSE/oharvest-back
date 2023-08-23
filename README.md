# Projet O'Harvest

## Technologies used

Back-office

![image](https://img.shields.io/badge/Sass-CC6699?style=for-the-badge&logo=sass&logoColor=white)
![image](https://img.shields.io/badge/Ejs-b4ca65?style=for-the-badge&logo=ejs&logoColor=white)
![image](https://img.shields.io/badge/JavaScript-323330?style=for-the-badge&logo=javascript&logoColor=F7DF1E)

Backend :

![image](https://img.shields.io/badge/Express%20js-000000?style=for-the-badge&logo=express&logoColor=white)
![image](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![image](https://img.shields.io/badge/Docker-2CA5E0?style=for-the-badge&logo=docker&logoColor=white)
![image](https://img.shields.io/badge/Swagger-85EA2D?style=for-the-badge&logo=Swagger&logoColor=white)

Script :

![image](https://img.shields.io/badge/Shell_Script-121011?style=for-the-badge&logo=gnu-bash&logoColor=white)

## Demo

A demo of the site is available [here](https://oharvest-352271be3541.herokuapp.com/)

You need an account to play with :

- User : tata@test.io or toto@test.io
- Password : oharvest (same password for each)

Some information: 

- The user creation and reset password are not existent. 
- The site is not responsive. It wasn't our priority during the development. It is used as a backoffice for our projet during the last month of the school formation

## Install

This project require the Docker engine. 

All commands need to be launch at the root of the project.

### Building image

In order to launch the app, you need to build the node image with the following command : 

```bash
docker-compose build
```

All dependencies are installed inside it.

### .env file

You need to configure the .env file.

Duplicate the file `.env.example` with a new name `.env`. Give all variables the correct values. 

All are mandatory except ENVIRONMENT. Don't touch the DBHOST value. It must be equal to the service name where the database is launch by docker.

If it is empty, the application will launch in prod environment. The only value accepted is `dev`.

### Launch the app

When the image build and the .env file configured, you can launch the application with the following command :

```bash
docker-compose up -d 
```

The database will start before the node application.

## Sqitch

The project use sqitch for versioning the database. Assure you have the following scripts :

- sqitch
- docker_sqitch_script.sh

This second script will download the first script, if it is missing, and add interaction to use sqitch. It will require some information depend on your configuration. 

It is highly recommended to copy the second script in order to store sensible information.

For development environment, you can uncomment the following variables (line 43, 45 and 47) and assign them a value. Don't forget to add this script inside the `.gitignore`.

```shell
# Design the user of the sql server who own the database of the project
#db_user=
# Represent the database of the project
#database=
# The password of the sql user
#db_password=
```

The engine variable design which RDBMS is used and `docker_host_port` define the port where your docker database listen on the host. 
```shell
#Allow you to configure which database engine and port you want to use for your project.
#Uncomment the one needed
engine=pg
docker_host_port=5432
```

For setting up the database, run the command (replace `docker_sqitch_script.sh` by the dev script if necessary) : 

```bash
bash docker_sqitch_script.sh -i && bash docker_sqitch_script.sh -d && bash migrations/seed.sh
```

When all command finish to execute, the application is ready.

## Reset the application

If you need to reset the database, you need to delete all the container and their associated volumes : 

```bash
# Delete the container need for the application then delete their volume.
docker-compose rm && docker volume rm o-harvest-back_db_data && docker volume rm o-harvest-back_node_module
```