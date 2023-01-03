# flasktut
Flask Tutorial

# Linux Quickstart
Note: Assume `docker` and `docker-compose` are already installed.

## Start web app
Listens on 127.0.0.1:8080
```
curl -sSO https://raw.githubusercontent.com/andylytical/flasktut/main/compose.yaml 
docker-compose pull
docker-compose up -d
```

## Stop
```
docker-compose stop
```

## Clean up
```
images=($(docker-compose -q images))
docker-compose rm -sfv
docker rmi "${images[@]}"
rm compose.yaml
```

# Build and run locally
```
git clone https://github.com/andylytical/flasktut
cd flasktut
docker-compose -f build.yaml
```
