# docker_compose

<img width="567" alt="Снимок экрана 2021-09-30 в 13 04 14" src="https://user-images.githubusercontent.com/12528718/135435521-6f4ce08e-0fa7-4bd7-a3f1-cfc91ea6e9b6.png">

Before starting the evaluation, run this command in 
the terminal: 
```
docker stop $(docker ps -qa); docker rm $(docker 
ps -qa);
docker rmi -f $(docker images -qa); docker volume rm $(docker volume ls -q); 
docker network rm $(docker network ls -q) 2>/dev/null
```

- [x] inside a srcs folder
- [x] Makefile is located at the root
- [ ] Read the "docker-compose.yml" file. There musn't be 
"network: host" in it.
- [ ] Examine the Makefile. There musn't be "--link" in it. 
- [ ] Examine the Dockerfiles. If you see "tail -f" in any of 
them, theevaluation ends now.

## Simple setup

- [ ] Ensure that NGINX can be accessed by port 443 only. Once done, openthe page. 
- [ ] Ensure that a SSL/TLS certificate is used. 
- [ ] Ensure that the WordPress website is properly installed and configured 
(you shouldn't see the WordPress Installation page). To access it, open https://login.42.fr in your browser, where login is the login of the evaluated student. You shouldn't be able to access the site via http://login.42.fr.

## Docker Basics
- [ ] Start by checking the Dockerfiles. There must be one 
Dockerfile perservice. Ensure that the Dockerfiles are not empty 
files. If it's not the case or if a Dockerfile is missing, the evaluation 
process ends now. 
- [ ] Make sure the evaluated student has written their own 
Dockerfiles and built their own Docker images. Indeed, it is 
forbidden to use ready-made ones or to use services such as 
DockerHub. 
- [x] Ensure that every container is built from the 
penultimate stable versionof Alpine Linux. 
- [ ] The Docker images must have the same name as their 
correspondingservice. Otherwise, the evaluation process ends 
now. 
- [ ] Ensure that the Makefile has set up all the services via 
docker-compose.This means that the containers must have been 
built using docker-compose and that no crash happened.

## Docker Network

- [ ] Ensure that docker-network is used by checking the docker-
compose.yaml file. Then run the "docker network ls" command to 
verify that a network is visible. 
- [ ] The evaluated student has to give you a simple explanation 
of docker-network.

## NGINX with SSL/TLS

- [ ] Ensure that there is a Dockerfile. 
- [ ] Using the "docker-compose ps" command, ensure that the 
container was created (using the flag '-p' is authorized if necessary). 
- [ ] Try to access the service via http (port 80) and verify that 
youcannot connect. 
- [ ] Open https://login.42.fr/ in your browser, where login is 
the loginof the evaluated student. The displayed page must be the 
configured WordPress website (you shouldn't see the WordPress 
Installation page).
- [ ] The use of a TLS v1.2/v1.3 certificate is mandatory 
and must be demonstrated. The SSL/TLS certificate doesn't have to be 
recognized. A self-signed certificate warning may appear.

## WordPress with php-fpm and its volume

- [ ] Ensure that there is a Dockerfile. 
- [ ] Using the "docker-compose ps" command, ensure that the container was created (using the flag '-p' is authorized if necessary). 
- [ ] Ensure that there is a Volume. To do so: Run the command "docker volume ls" then "docker volume inspect ". Verify that the result in the standard output contains the path "/home/login/data/", where login is the login of the evaluated student. 
- [ ] Ensure that you can add a comment using the available WordPress user.
- [ ] Sign in with the administrator account to access the Administration dashboard. The Admin username must not include "admin" or "Admin" (e.g., admin, administrator, Admin-login, admin-123, and so forth). 
- [ ] From the Administration dashboard, edit a page. Verify on the website that the page has been updated.

##  MariaDB and its volume
- [ ] Ensure that there is a Dockerfile. 
- [ ] Using the "docker-compose ps" command, ensure that the container wascreated (using the flag '-p' is authorized if necessary). 
- [ ] Ensure that there is a Volume. To do so: Run the command "docker volume ls" then "docker volume inspect". Verify that the result in the standard output contains the path "/home/login/data/", where login is the login of the evaluated student. 
- [ ] The evaluated student must be able to explain you how to login intothe database. Try to login into the SQL database as root but with no password. If the login is successful, the evaluation process ends now. - Try to login into the SQL database with the user account and its password. Verify that the database is not empty.

## Persistence
- [ ] - This part is pretty straightforward. You have to reboot the virtual machine. Once it has restarted, launch docker-compose again. Then, verify that everything is functional, and that both WordPress and MariaDB are configured. The changes you made previously to the WordPress website should still be here. If any of the above points is not correct, the evaluation process ends now.

## Bonus
- [ ] Set up redis cache for your WordPress website in order to properly manage the cache.
- [ ] Set up a FTP server container pointing to the volume of your WordPress website.
- [ ] Create a simple static website in the language of your choice except PHP (Yes, PHP is excluded!). For example, a showcase site or a site for presenting your resume.
- [ ] Set up Adminer.
- [ ] Set up a service of your choice that you think is useful. During the defense, you will have to justify your choice.
