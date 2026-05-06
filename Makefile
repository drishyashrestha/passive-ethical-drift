.PHONY: install test lint run score graphs all clean

# Install runtime dependencies into the active environment
install:
	pip install -r requirements.txt

# Verify API connection before running the full experiment
test:
	python scripts/test_connection.py

# Lint scripts and scenario modules (ignores long lines in scenario strings)
lint:
	ruff check scripts/ scenarios/ --ignore E501

# Run all 5 models x 2 scenarios x 30 turns and save JSON logs
run:
	python scripts/run_conversations.py

# Score key turns using GPT-4.1 and write results/scores.csv
score:
	python scripts/score_responses.py

# Generate graphs from results/scores.csv
graphs:
	python scripts/generate_graphs.py

# Run the full pipeline end to end
all: run score graphs

# Remove generated outputs (keeps raw data)
clean:
	rm -f results/scores.csv results/*.png results/*.pdf
