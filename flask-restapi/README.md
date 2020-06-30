# Digital Innovation Lab Project

### Technologies to Use

#### Requirements
- Docker : You can install the docker desktop for windows I believe, incase you are using windows
- Git
- Atom: Install atom editor, python package and dart package in atom,  we need them.

#### FrontEnd
- Flutter

#### Backend
- Python Flask
- Postgres
- Clickhouse

### Running the app now

Run this command in your terminal, this will start the application,  the backend alone.

```
docker-compose up --build
```

### TODO

#### Scenario Under consideration: Checking crowd Intensity near restaurants and suggesting  best options for the spectator.

#### Tasks and Explanations

- Front End:
  1. Create a login with one user name and a page.
  2. And the page where we can select to check restaurant. (Need not implement any other functionalties)
  3. A page when upon clicking on check restatrant loads the list of restaurants with on side a crowd intensity(We can draw a basic sketch on how to see this. Its a rough idea though.)

- Backend
  1. A database with following tables like user, reservations and orders.
  2. API for the following functionalities:
    1. Login
    2. Make a reservation, we shall keep it simple. Just with a pop saying your spot is reserved.
    3. API to do a calculation on crowd estimate:We shall create a fake script to pass to clickhoue and process the data in python, and render it out to front end.

- Connections
  - Connecting flutter to Python API
  - Connecting clickhouse database to python.

### TODO

| Task Number   |      Person      |  Tips | Done |
|----------|:-------------:|------:|------: |
| FE 1 |  F/P | You can check a dummy login implemenatation copy same things and run it. |   |
| FE 2 | P/F  | Just make a screen similar to the one we did in mockup. Some boxes with names in it,  with just restaturant one clickable | |
| FE 3| F/P | You a structure similar to glovo/uber eats or anything that list the number of restaurants, and just add an icon to check crowd intensity | |
|BE 0 |Haritha | Skeleton Setup | |
|BE 1| H/G | | |
|BE 2| H/G | | |
|BE 3| H/G/F/P | | |
|C1||||
|C2||||

### References for Flutter and Flask

- Just get a basic idea of how it works, like main function and things like that.
- Check in github explore for the type of front end view you need, see check for restaurant app flutter and you will get sample ones,  just reuse them, we don't need anything big.
- I learned some from [here] (https://www.youtube.com/watch?v=1ukSR1GRtMU&list=PL4cUxeGkcC9jLYyp2Aoh6hcWuxFDX6PBJ)
- I also have a paid course module on flutter, incase you need that I am happy to share the credentials

### TIPS

- For front end
  -  Create a project folder named front end and do everything related to front end there.
  - So the structure would look like:
    - server
    - front-end (This part need not be dependent on anything outside. You might need to add this to docker, but we can do later, if front end works)
    -  .env
    - requirements

# RUNNING THE APPLICATION

## flask-restapi
A Flask based RESTful API using SQLAlchemy to communicate with PostgreSQL

## Getting started
Build docker image:
```
Clone the repo
cd flask-restapi
docker build -t flask-restapi:2.7 .
...
docker images
REPOSITORY                                TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
flask-app                                 2.7                 sha256:eaf3e        10 minutes ago      699.2 MB
```
For testing purposes, you can use official [PostgreSQL](https://hub.docker.com/r/_/postgres/) Docker image as follow:
```
docker pull postgres:9.3
docker run -d -p 5432:5432 -v $(pwd)/sql:/data -e POSTGRES_PASSWORD=password --name postgres-db postgres:9.3
docker exec -it postgres-db bash
root@8254335c8597:/# psql -U postgres -d postgres -a -f /data/setup.sql
...
(3, 1452510897.95, 21.9),
(4, 1452510897.95, 21.8),
(5, 1452510897.95, 23),
(6, 1452510897.95, 22.4),
(7, 1452510897.95, 0);
INSERT 0 42
root@80f7ee057570:/# exit
```

Now you can ```docker run``` the flask-app by setting the neccessary environment variables:
```
docker run -d \
      -p 8080:8080 \
      -e DB_NAME='<db_name>' \
      -e DB_HOST='<db_host>' \
      -e DB_PORT='<db_port>' \
      -e DB_USER='<db_user>' \
      -e USER_PASSWORD='<user_password>' \
      --name flask \
      flask-app:2.7
...
docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                    NAMES
e45b7aeb04ce        flask-app:2.7       "python ./api.py"        2 seconds ago       Up 1 seconds        0.0.0.0:8080->8080/tcp   flask
```

## API

| HTTP | Endpoint                         | Description                      |
|------|----------------------------------|----------------------------------|
| GET  | /api/v1/sensors                  | get metadata from all sensors    |
| GET  | /api/v1/sensors/\<id\>             | get metadata from sensor <id>    |
| GET  | /api/v1/sensors/\<id\>/data        | get all data from sensor <id>    |
| GET  | /api/v1/sensors/\<id\>/data/latest | get latest data from sensor <id> |
