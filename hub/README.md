# Selenoid Hub
Selenoid Hub acting like Selenium Hub, but launching browsers within Docker containers per session request.

## Dokerfile
* `latest` ([1.0/Dockerfile](https://github.com/selenoidhq/docker-selenoid/blob/master/hub/Dockerfile))

## How to use this image
Pull the docker images: 
* `docker pull selenoid/firefox` - the JavaLess image with Firefox browser and GeckoDriver
* `docker pull selenoid/chrome` - the JavaLess image with Chrome browser and ChromeDriver

### Run Selenoid Hub with local docker
To run the Selenoid Hub in the background, use the following command:
```
$ docker run --privileged -v /var/run/docker.sock:/var/run/docker.sock -p 4444:4444 -d selenoid/hub
```
You can test it by visiting http://<docker>:4444/status in a browser. 
### Run Selenoid Hub with remote docker
To run the Selenoid Hub in the background, use the following command:
```
$ docker run -e DOCKER_API=tcp://<host>:4243 -p 4444:4444 -d selenoid/hub
```

## Configuration
By default selenoid uses the following configuration file: 
```
{
  "firefox": {
    "default": "latest",
    "versions": {
      "latest": {
        "image": "selenoid/firefox:latest",
        "port": "4444"
      }
    }
  },
  "chrome": {
    "default": "latest",
    "versions": {
      "latest": {
        "image": "selenoid/chrome:latest",
        "port": "4444"
      }
    }
  }
}
```
Configuration can be discovered under `/etc/selenoid/browsers.json`. 
You can run the Selenoid Hub container with mounted volume and edit this file.

## Environment Variables
### `MAX_INSTANCES`
Default value: `5`.
This variable is optional. It allows you to specify the number of simultaneously running containers with browsers. 
### `DOCKER_API`
Default value: `unix:///var/run/docker.sock`.
This variable is optional. It allows you to specify the docker api location. 
You can access to remote docker by url: `tcp://<host>:4243`

## License
View [license information](https://github.com/selenoidhq/docker-selenoid/blob/master/LICENSE) for the software contained in this image.
