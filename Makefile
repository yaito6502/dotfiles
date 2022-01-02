DOTFILES_EXCLUDES := .git .gitmodules .gitignore
DOTFILES_TARGET   := $(wildcard .??*)
DOTFILES_DIR      := $(PWD)
DOTFILES_FILES    := $(filter-out $(DOTFILES_EXCLUDES), $(DOTFILES_TARGET))

list:
	@$(foreach val, $(DOTFILES_FILES), /bin/ls -dF $(val);)

deploy:
	@$(foreach val, $(DOTFILES_FILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

init:
	@$(foreach val, $(wildcard ./etc/init/*.sh), bash $(val);)

clean:
	@-$(foreach val, $(DOTFILES_FILES), rm -vrf $(HOME)/$(val);)
