clean:
	rm app.jspp.js

test:
	js++ ./src ./test ../ConsoleStyle/ && node app.jspp.js
	$(MAKE) clean

.PHONY: test
.SILENT:clean