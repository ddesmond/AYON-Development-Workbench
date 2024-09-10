### workbench tools make file v1.0.0
.EXPORT_ALL_VARIABLES:

DEV_ROOT = foo
GIT_ROOT = https://github.com/ynput
MAKE_PATH = $(shell pwd)
WORKBENCH_ROOT_PATH = $(shell pwd)/../
WRKB_AYON_PATH = $(shell pwd)/../ayon
WRKB_AYON_ADDONS_PATH = $(shell pwd)/../ayon/addons
SET_AYON_BUNDLE=dev-latest
AYON_LAUNCHER_STORAGE_DIR = $(shell pwd)/../ayon

### setup
.PHONY: setup
setup: ## Welcome message
	@echo "Makefile for working with ayon codebase"
	@bash .art.sh
	@$(MAKE) help

set-env: ## Set environment variables - server apikey, server url
	@echo "Set environment variables to .env file"
	@bash set-env.sh

set-bundle-name: ## Set bundle name
	@echo "Set bundle name"
	@bash set-bundle-name.sh

.PHONY: dontrun
dontrun: ## Don't run this if you have your machine setup already.
	@echo "Makefile for working with ayon codebase"
	@echo "Install all prequisites and deps"
	@echo "Setting up Ubuntu setup"
	@bash setup-ubuntu.sh
	@bash setup-pyenv.sh
	@bash setup-pyenv-python.sh
	@mkdir -p $$WRKB_AYON_PATH && chmod -R 777 $$WRKB_AYON_PATH

show-env: ## Show environment variables in the Makefile and the shell
	@echo "ENV info"
	@echo "-------------------------"
	@echo $(foreach var,$(.VARIABLES),$(info $(var) = $($(var))))

update-addons: ## Update all addons pull
	@echo "Update"
	cat repolist-addons.sh | xargs -I _repo bash repo-clone.sh $$WRKB_AYON_ADDONS_PATH/_repo "pull -> develop"

update-core: ## Update core pull
	@echo "Update Core"
	cat repolist-core.sh | xargs -I _repo bash repo-clone.sh $$WRKB_AYON_PATH/_repo "pull -> develop"


setup-clone: ## Clone ALL repos (both server and addons)
	@echo "Clone ALL repositories"

setup-clone-core:  ## Clone all core repos
	@echo "Clone core repos only"
	@echo "Clean first! This will clean all addons in the ayon folder"
	@rm -rf $$WRKB_AYON_PATH
	@mkdir -p $$WRKB_AYON_PATH && chmod -R 777 $$WRKB_AYON_PATH
	@cat repolist-core.sh | xargs -I repo mkdir -p $$WRKB_AYON_PATH/repo
	@cat repolist-core.sh | xargs -I repo git clone $$GIT_ROOT/repo.git $$WRKB_AYON_PATH/repo --depth 1 --recurse-submodules
	$(MAKE) update-core

setup-clone-addons: ## Clone all addons
	@echo "Clone addons only"
	@echo "Clean first! This will clean all addons in the ayon/addons folder"
	@rm -rf $$WRKB_AYON_ADDONS_PATH
	@mkdir -p $$WRKB_AYON_ADDONS_PATH && chmod -R 777 $$WRKB_AYON_ADDONS_PATH
	@cat repolist-addons.sh | xargs -I repo mkdir -p $$WRKB_AYON_ADDONS_PATH/repo
	@cat repolist-addons.sh | xargs -I repo git clone $$GIT_ROOT/repo.git $$WRKB_AYON_ADDONS_PATH/repo --depth 1 --recurse-submodules
	$(MAKE) update-addons


setup-clean: ## Clean the cloned setup, this will PERMA delete the cloned repos.
	@echo "Setup clean"
	#cat repolist-all.sh | xargs -I repo echo "remove" root/repo

dev:
	echo "dev"

### instances
launch-local: ## Launch local Ayon server with ayon-docker
	@echo "Launch local Ayon server"

### teardown
down: ## Teardown the cloned setup, this will PERMA delete the cloned repos.
	@bash teardown.sh $$WRKB_AYON_ADDONS_PATH $$WRKB_AYON_PATH

###### work with repos

### launcher
launcher-init: ## Init launcher
	@echo "Init launcher"
	@echo "Launcher - Create env"
	@bash launcher-create-env.sh $$WRKB_AYON_PATH

launcher-clean:	## Clean launcher
	@echo "Clean launcher"
	rm -rf $$WRKB_AYON_PATH/ayon-launcher/*.lock
	rm -rf $$WRKB_AYON_PATH/ayon-launcher/.poetry

launcher-build: ## Build launcher
	@echo "Build launcher"
	$(MAKE) launcher-clean
	$(MAKE) launcher-init


### dependencies
deps-install: ## ayon-dependencies tool - Install dependencies
	@echo "Deps - instal"
	bash dependencies-init.sh $$WRKB_AYON_PATH

deps-create: ## Create a bundle, specify the bundle name in the env
	@echo "Deps - create bundle"
	bash dependencies-create.sh $$WRKB_AYON_PATH $$SET_AYON_BUNDLE

deps-create-docker-%: ## Create a bundle from docker, specify the bundle name in the env, specify the docker build name
	@echo "Deps - create bundle from docker ."
	bash dependencies-create-docker.sh $$WRKB_AYON_PATH $$SET_AYON_BUNDLE "$(subst deps-create-docker-,,$@)"

### bundles
bundles-list: ## List bundles on the server, needs .env to be properly setup
	@echo 'List bundles on the server'
	bash get-bundles.sh $$WRKB_AYON_PATH

### ayon core
update-ayon-core-env: ## Update ayon core environment
	@echo "Update ayon core env"
	bash ayon-core-update.sh $$WRKB_AYON_PATH

### addons
create-upload-addon: ## Create and upload an addon to the Ayon server
	echo "Create and upload an addon to the Ayon server"

compile-addons: ## Compile addons
	@echo "Compile addons"
	# bash compile-addons.sh $$WRKB_AYON_ADDONS_PATH

compile-addon-%: ## Compile an addon, specify the addon name
	@echo "Compile addon"
	bash compile-addon.sh $$WRKB_AYON_ADDONS_PATH "$(subst compile-addon-,,$@)"


### services
service-list: ## List services
	echo "List services"
	echo "Shotgrid"
	echo "kitsu"
	echo "ftrack"

# shotgrid
service-install-shotgrid: ## Install a service, specify the service name
	@echo "Install service Shotgrid"
	@bash services/service-install-shotgrid.sh $$WRKB_AYON_PATH

service-start-shotgrid: ## Start a service, needs bundle name
	@echo "Start service Shotgrid"
	@bash services/service-start-shotgrid.sh $$WRKB_AYON_PATH $$SET_AYON_BUNDLE

service-start-leecher-shotgrid: ## Starts a leecher service, needs bundle name
	@echo "Start Leecher service Shotgrid"
	@bash services/service-start-leecher-shotgrid.sh $$WRKB_AYON_PATH $$SET_AYON_BUNDLE


# ftrack
service-install-ftrack: ## Install a service, specify the service name
	@echo "Install service Ftrack"
	@bash services/service-install-ftrack.sh $$WRKB_AYON_PATH

service-start-ftrack: ## Starts a service, needs bundle name
	@echo "Start service Ftrack"
	@bash services/service-start-ftrack.sh $$WRKB_AYON_PATH $$SET_AYON_BUNDLE

service-start-leecher-ftrack: ## Starts a leecher service, needs bundle name
	@echo "Start Leecher service Ftrack"
	@bash services/service-start-leecher-ftrack.sh $$WRKB_AYON_PATH $$SET_AYON_BUNDLE

service-start-processor-ftrack: ## Starts a leecher service, needs bundle name
	@echo "Start Leecher service Ftrack"
	@bash services/service-start-processor-ftrack.sh $$WRKB_AYON_PATH $$SET_AYON_BUNDLE



# kitsu
service-install-kitsu: ## Install a service, specify the service name
	@echo "Install service Kitsu"
	@bash services/service-install-kitsu.sh $$WRKB_AYON_PATH

service-start-processor-kitsu: ## Starts a leecher service, needs bundle name
	@echo "Start Processor service Kitsu"
	@bash services/service-start-processor-kitsu.sh $$WRKB_AYON_PATH $$SET_AYON_BUNDLE


### docker

ayon-docker: ## Launch ayon-docker
	@echo "Launch ayon-docker"
	@bash ayon-docker.sh $$WRKB_AYON_PATH

ayon-docker-refresh: ## Refresh ayon-docker
	@echo "Refresh ayon-docker"
	@bash ayon-docker-refresh.sh $$WRKB_AYON_PATH

ayon-docker-restart: ## Restart ayon-docker
	@echo "Restart ayon-docker"
	@bash ayon-docker-restart.sh $$WRKB_AYON_PATH

ayon-docker-down: ## Down and remove ayon-docker
	@echo "Remove ayon-docker"
	@bash ayon-docker-remove.sh $$WRKB_AYON_PATH


### utils
get-path: ## Get Workbench path
	echo $$MAKE_PATH
	echo $$WORKBENCH_ROOT_PATH

test: ## Run test - repos clone and remove, no compile.
	echo "test"
	echo $(MAKE_PATH)
	echo $(WORKBENCH_ROOT_PATH)
	echo $(WRKB_AYON_PATH)
	echo $(WRKB_AYON_ADDONS_PATH)
	echo $(SET_AYON_BUNDLE)
	$(MAKE) show-env
	$(MAKE) get-path
	$(MAKE) setup-clone-core
	$(MAKE) setup-clone-addons
	$(MAKE) update-core
	$(MAKE) update-addons
	$(MAKE) down



# help
help: ## Display this help screen
	@echo "Makefile for working with ayon codebase"
	@grep -E '^[a-z.A-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@echo "-------------------------"
