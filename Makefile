export dotfiles=${HOME}/dotfiles

install: update init clean deploy
	@exec $$SHELL

update: ## Fetch changes for this repo
	git pull origin main

init: ## Setup environment settings
	export PATH=$PATH:$HOME/dotfiles/bin
	@echo '==> Start to install app using pkg manager.'
	@echo ''
	bash ${dotfiles}/etc/init

clean: ## Clean config files
	@echo '==> Start to clean your config files.'
	@echo ''
	bash ${dotfiles}/etc/clean

deploy: clean ## Create symlink
	@echo '==> Start to deploy dotfiles to home directory.'
	@echo ''
	bash ${dotfiles}/etc/deploy

test:
	@echo ${dotfiles}

help: ## Self-documented Makefile
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
