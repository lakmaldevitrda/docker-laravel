
## Build and Run Docker Containers

```bash
docker-compose build
docker-compose up -d
```

## Stop Docker Containers

```bash
docker-compose down
```

## Install Laravel Dependencies

```bash
docker-compose exec app composer install
docker-compose exec app php artisan key:generate
```

## Run Migrations

```bash
docker-compose exec app php artisan migrate
```

## Check Docker Container Status

```bash
docker-compose ps
```

## Check MySQL Logs

```bash
docker logs laravel-db
```

## Check Laravel Cache

```bash
docker-compose exec app php artisan config:cache
```