# Weather API

## Setup

### Pre-requisites:

- Docker
- docker-compose

#### Docker

Install Docker for your platform.

- Mac: https://store.docker.com/editions/community/docker-ce-desktop-mac
- Windows: https://store.docker.com/editions/community/docker-ce-desktop-windows
- Linux: Please see your distributions package management system

#### docker-compose

Install docker-compose for your platform.

- Mac: Included with Docker
- Windows: Included with Docker
- Linux: Please see your distributions package management system

### Misc.

We are using Ruby, Node, etc. through Docker. In order to use tools like Rails and Yarn through Docker, we must pass our commands to the Docker container. This is a really long command:

`docker-compose -f docker-compose.cli.yml run --rm composer install`

Because of this, it is recommended to create an alias for `docker-compose -f docker-compose.cli.yml run --rm` and call it `dcli` (Docker CLI).

### Installation

First we need to clone the project.

```bash
cd ~/code # or whatever directory you keep your projects in

git clone https://github.com/MiguelTzab/weather-api.git
cd weather-api
```

Next we need to copy the `docker-compose.yml.dist` file and update it for our system.

```bash
cp .env.dist .env
cp docker-compose.override.yml.dist docker-compose.override.yml
```

> **Note:** _Personalize the `docker-compose.override.yml` for your system. If you are using Mac, it is recommended to change `- .:/application` to `- .:/application:cached` for the best performance. However, the default file will work out of the box._

Now that we have the application configured, we need to install our dependencies. Before doing that though we need the docker images we use.

```bash
docker-compose pull
docker-compose build
```

And finally it's time to start up our containers:

- With docker:

```bash
docker-compose up -d
```

- With rails command:

```bash
rails server # this run on port 3000
```

## API Usage

To use the API, send a GET request to the following endpoint:

localhost:8004/api/v1/weather/cities?name={city_name}

### Parameters

- `name`: The partial or full name of the city (required).

#### Example

```bash
curl -X GET "localhost:3000/api/v1/weather/cities?name=chetumal"
```