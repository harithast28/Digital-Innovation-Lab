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

