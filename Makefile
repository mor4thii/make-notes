.PHONY: new-note open-note list-notes commit

new-note:
	./scripts/new-daily-note.sh

open-note:
	./scripts/open-todays-note.sh

list-notes:
	./scripts/list-notes.sh

commit:
	./scripts/git-autocommit.sh $(msg)
