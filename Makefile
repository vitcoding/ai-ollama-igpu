# ollama (intel gpu)
OLLAMA-IGPU-DC = ollama-igpu/docker-compose-ollama.igpu.yml
OLLAMA-IGPU-NAME = ollama-igpu
OLLAMA-IGPU-SERVICE-NAME = ollama-igpu-container

create:
	make up-$(OLLAMA-IGPU-NAME)
# docker exec -it $(OLLAMA-IGPU-SERVICE-NAME) ollama pull evilfreelancer/enbeddrus
# docker exec -it $(OLLAMA-IGPU-SERVICE-NAME) ollama pull gemma2:9b
# docker exec -it $(OLLAMA-IGPU-SERVICE-NAME) ollama pull llama3.2:3b
# docker exec -it $(OLLAMA-IGPU-SERVICE-NAME) ollama pull llama3.1:8b
# docker exec -it $(OLLAMA-IGPU-SERVICE-NAME) ollama pull llama3.2-vision:11b
# docker exec -it $(OLLAMA-IGPU-SERVICE-NAME) ollama pull deepseek-r1:8b
# docker exec -it $(OLLAMA-IGPU-SERVICE-NAME) ollama pull deepseek-r1:14b
# docker exec -it $(OLLAMA-IGPU-SERVICE-NAME) ollama pull qwen2.5-coder:7b
# docker exec -it $(OLLAMA-IGPU-SERVICE-NAME) ollama pull qwen2.5-coder:14b
# docker exec -it $(OLLAMA-IGPU-SERVICE-NAME) ollama pull gemma3:1b
# docker exec -it $(OLLAMA-IGPU-SERVICE-NAME) ollama pull gemma3:4b
# docker exec -it $(OLLAMA-IGPU-SERVICE-NAME) ollama pull gemma3:12b

destroy:
	make destroy-$(OLLAMA-IGPU-NAME)

up:
	make up-$(OLLAMA-IGPU-NAME)
down:
	make down-$(OLLAMA-IGPU-NAME)
stop:
	make stop-$(OLLAMA-IGPU-NAME)
start:
	make start-$(OLLAMA-IGPU-NAME)

# ollama (intel gpu)
# OLLAMA-IGPU-NAME = ollama-igpu
create-$(OLLAMA-IGPU-NAME):
	docker compose -f $(OLLAMA-IGPU-DC) up -d --build --force-recreate
destroy-$(OLLAMA-IGPU-NAME):
	docker compose -f $(OLLAMA-IGPU-DC) down --rmi all --volumes --remove-orphans

up-$(OLLAMA-IGPU-NAME):
	docker compose -f $(OLLAMA-IGPU-DC) up -d
down-$(OLLAMA-IGPU-NAME):
	docker compose -f $(OLLAMA-IGPU-DC) down -v

stop-$(OLLAMA-IGPU-NAME):
	docker compose -f $(OLLAMA-IGPU-DC) stop
start-$(OLLAMA-IGPU-NAME):
	docker compose -f $(OLLAMA-IGPU-DC) start

# ollama commands
# docker exec -it ollama-igpu-container ollama list
# docker exec -it ollama-igpu-container ollama pull llama3.2-vision:11b
# docker exec -it ollama-igpu-container ollama pull gemma3:4b
# docker exec -it ollama-igpu-container ollama run gemma3:4b
# docker exec -it ollama-igpu-container ollama rm gemma3:4b

# docker compose -f ollama-igpu/docker-compose-ollama.igpu.yml logs --tail=100 ollama-igpu
