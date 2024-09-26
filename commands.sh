# TODO: Command to create ALL ddls.
# TODO: Command + script to send kafka updates.

# Starts the risingwave cluster
start-cluster() {
	docker-compose -f docker/docker-compose.yml up -d
}

# Stops the risingwave cluster
stop-cluster() {
	docker-compose -f docker/docker-compose.yml down
}

# Cleans the risingwave cluster
clean-cluster() {
	docker-compose -f docker/docker-compose.yml down -v
}

