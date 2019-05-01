SUPERSET_REPO = https://github.com/apache/incubator-superset.git
SUPERSET_VERSION = release--0.32
SUPERSET_REMOTE = upstream

.PHONY: merge-superset
merge-superset:
	# TODO check if already exists
	git remote add -f $(SUPERSET_REMOTE) $(SUPERSET_REPO)
	git merge --squash -s subtree --no-commit remotes/$(SUPERSET_REMOTE)/$(SUPERSET_VERSION)

# Create docker image
.PHONY: build
build:
	docker build -t smacker/superset:demo -f docker/Dockerfile .
