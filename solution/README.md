# 1) Step to run container with csvserver image
```
docker run -d --name csvserver infracloudio/csvserver:latest
```
# 2) checking logs of containers to find out the reason for failure
```
docker logs -f csvserver
```
```
error - failing with reason - error while reading the file "/csvserver/inputdata": open /csvserver/inputdata: no such file or directory
```
# 3) Write a bash script gencsv.sh to generate a file named inputFile
 ```
chmod 777 ./gencsv.sh && ./gencsv.sh 2 8
```
# 4) Run the container again in the background with file generated in (3) available inside the container (remember the reason you found in (2)).
```
docker rm -f csvserver && docker run -d --name csvserver -v "$(pwd)/inputFile:/csvserver/inputdata" infracloudio/csvserver:latest
```
# 5) Get shell access to the container and find the port on which the application is listening. Once done, stop / delete the running container.
```
docker exec -ti csvserver netstat -tulnp
```

# 6) Same as (4), run the container and make sure, The application is accessible on the host at http://localhost:9393 Set the environment variable CSVSERVER_BORDER to have value Orange.
```
docker rm -f csvserver && docker run -d --name csvserver -v "$(pwd)/inputFile:/csvserver/inputdata" --env "CSVSERVER_BORDER=Orange" -p 9393:9300 infracloudio/csvserver:latest
```

