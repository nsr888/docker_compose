DOCKER_COMPOSE_FILE=srcs/docker-compose.yml

create_volume_dirs:
	mkdir -p ~/data/mariadb
	mkdir -p ~/data/wordpress

build: create_volume_dirs
	docker-compose -f $(DOCKER_COMPOSE_FILE) build $(c)

up: create_volume_dirs
	docker-compose -f $(DOCKER_COMPOSE_FILE) up $(c)

start: create_volume_dirs
	docker-compose -f $(DOCKER_COMPOSE_FILE) up -d $(c) 

stop:
	docker-compose -f $(DOCKER_COMPOSE_FILE) stop $(c)

restart:
	docker-compose -f $(DOCKER_COMPOSE_FILE) up $(c) -d

status:
	docker-compose -f $(DOCKER_COMPOSE_FILE) ps

ps: status

clean: confirm
	docker-compose -f $(DOCKER_COMPOSE_FILE) down
	docker volume rm srcs_mariadb_data
	docker volume rm srcs_wordpress_data

cleanwp: confirm
	docker-compose -f $(DOCKER_COMPOSE_FILE) stop nginx
	docker-compose -f $(DOCKER_COMPOSE_FILE) stop wordpress
	docker container rm -f nginx
	docker container rm -f wordpress
	docker image rm -f nginx
	docker image rm -f wordpress
	docker volume rm srcs_wordpress_data

fclean: confirm
	docker stop $$(docker ps -qa)
	docker rm -f $$(docker ps -qa)
	docker rmi -f $$(docker images -qa)
	docker volume rm -f $$(docker volume ls -q)
	docker network rm $$(docker network ls -q) 2>/dev/null

confirm:
	@echo -n "Are you sure? [y/N] " && read ans && [ $${ans:-N} = y ]

.PHONY: build up start stop restart status ps clean confirm
