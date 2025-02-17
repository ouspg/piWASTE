# piWASTE - Purposely Insecure Web Application for Security Training and Education
![Actions Workflow](https://github.com/mmalmi1/piWASTE/workflows/Flask/badge.svg)

Educational purposely insecure website for demonstrating web vulnerabilities. Originally developed as a student project in UniOulu 521479S Software Project course in 2020. 

## Run the server
Make sure you have `FLASK_APP` defined:
```bash
Linux:
export FLASK_APP=app
Windows:
set FLASK_APP=app
```

Enable debugging mode
```bash
Linux:
export FLASK_ENV=development
Windows:
set FLASK_ENV=development
```

Before running you need to initialize the database

```bash
flask init-db
```
And then run the server
```bash
flask run
```

## Run the docker container

You can use docker-compose to run the server in a container which mounts the current working directory. So it's possible to edit the code while the container is running.

```bash
docker-compose up
```

To tear it down, you can just run:
```bash
docker-compose down
```

If you want to try building a clean container, you can build the image and run it:
```bash
docker build . -t piwaste
docker run -it --network=host piwaste # network=host is needed to be able to access it from the outside
```
## Requirements

```bash
pip install -r requirements.txt
```

## Running local tests

```bash
python -m pytest
```
