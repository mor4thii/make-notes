.PHONY: new-note open-today new-topic open-topic list-notes sync-tasks sync-time commit

new-note:
	@./scripts/new-daily-note.sh

open-today:
	@./scripts/open-todays-note.sh

new-topic:
	@./scripts/new-topic.sh "$(topic)" "$(title)"

open-topic:
	@./scripts/open-topic.sh "$(topic)" "$(title)"

list-notes:
	@./scripts/list-notes.sh

sync-tasks:
	@./scripts/sync-tasks.sh

sync-time:
	@./scripts/sync-time.sh

commit:
	@./scripts/git-autocommit.sh "$(msg)"
