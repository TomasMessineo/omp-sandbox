.PHONY: init up-all up-33 up-34 up-35 down cron-33 cron-35 snapshot-33 snapshot-34 snapshot-35 clean

init:
	chmod +x scripts/*.sh 2>/dev/null || true
	mkdir -p fixtures/files/omp33 fixtures/files/omp34 fixtures/files/omp35
	chmod -R 777 fixtures/files 2>/dev/null || true
	chmod -R 777 omp-3.3.0-23/cache omp-3.3.0-23/public 2>/dev/null || true
	chmod -R 777 omp-3.4.0-11/cache omp-3.4.0-11/public 2>/dev/null || true
	chmod -R 777 omp-3.5.0-5/cache omp-3.5.0-5/public 2>/dev/null || true
	chmod 666 omp-*/config.inc.php 2>/dev/null || true

up-all: init
	docker compose --profile all up -d

up-33: init
	docker compose --profile 3.3 up -d db omp33 phpmyadmin

up-34: init
	docker compose --profile 3.4 up -d db omp34 phpmyadmin

up-35: init
	docker compose --profile 3.5 up -d db omp35 phpmyadmin

down:
	docker compose --profile all down

cron-33:
	docker compose exec omp33 php tools/runScheduledTasks.php plugins/generic/acron/scheduledTasks.xml

cron-35:
	docker compose exec omp35 php lib/pkp/tools/scheduler.php run

snapshot-33:
	./scripts/snapshot.sh 33

snapshot-34:
	./scripts/snapshot.sh 34

snapshot-35:
	./scripts/snapshot.sh 35

clean:
	docker compose --profile all down -v
