up:
	docker compose up -d --build --remove-orphans
	docker compose logs app -f

shell:
	docker compose run --rm app flask shell

ssh:
	sh ./scripts/run-ssh.sh

db:
	docker compose run db psql -h db -U postgres

upgrade: up
	docker compose run --rm app flask db upgrade
