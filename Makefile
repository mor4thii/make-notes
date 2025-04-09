Makefile for managing work notes

.PHONY: todo list-todos todo-done todo-progress filter-todos edit-task

todo:
	@./scripts/add-todo.sh $(filter-out $@,$(MAKECMDGOALS))

list-todos:
	@nl -w2 -s'. ' todo.md

todo-done:
	@./scripts/update-task-status.sh $(word 2, $(MAKECMDGOALS)) done

todo-progress:
	@./scripts/update-task-status.sh $(word 2, $(MAKECMDGOALS)) progress

filter-todos:
	@./scripts/filter-tasks.sh $(word 2, $(MAKECMDGOALS))

edit-task:
	@./scripts/edit-task.sh $(word 2, $(MAKECMDGOALS)) $(wordlist 3, 99, $(MAKECMDGOALS))