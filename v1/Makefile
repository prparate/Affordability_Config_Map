.PHONY: help
help:		## Displays this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

.PHONY: update-all
update-all:	## Create/Update ConfigMap for the desired environment. [requires ENV=${value}, ex: ENV=dev]
	@for dir in ./$$ENV/* ; do \
		echo $$dir ; \
		kubectl replace -f $$dir ; \
	done

.PHONY: update-one
update-one:	## Create/Update given ConfigMap for the desired environment. [requires MAP=${value2} ENV=${value1}, ex: MAP=redis ENV=dev]
	kubectl replace -f ./$$ENV/$$MAP.$$ENV.yaml
