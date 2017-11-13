clean:
	rm app.jspp.js

test:
	js++ ./src ./test libs/ConsoleStyle/src/ && node app.jspp.js
	$(MAKE) clean

.PHONY: test
.SILENT:clean