# js++Unit

js++Unit is an xUnit unit testing framework for writing and running automated tests using the JS++ programming language.

The library features a very concise and familiar syntax. js++Unit was inspired by the [Mocha](https://github.com/mochajs/mocha) test framework for JavaScript and other xUnit frameworks.

## Getting Started

Download the [ConsoleStyle](https://github.com/onux/jspp/tree/master/Libraries/ConsoleStyle) library, which js++Unit depends on.

In your editor, create a `test.jspp`:

	import Vendor.JSPPUnit;
	import Vendor.JSPPUnit.Assert;

	suite("Math", void() {
		test("plus", void() {
			equal( 1 + 1 , 2 );
		});
	});
	JSPPUnit.run();

In your terminal:

    $ js++ test.jspp path/to/jsppUnit/src/ path/to/ConsoleStyle/src/

You need to link the `js++Unit` library *and* the `ConsoleStyle` library (which `js++Unit` depends on) in order to successfully compile. The best practice is to use the `src` folder for the libraries rather than the libraries' root directories; otherwise, there may be tests and other unwanted files fed into the compiler, and the compiler will complain there is more than one [main file](https://docs.onux.com/en-US/Developers/JavaScript-PP/Language-Guide/main-file).

The compiler should have generated an `app.jspp.js` file. Run it (e.g. with [Node.js](https://nodejs.org/)) and you should see the test output:

    $ node app.jspp.js
      Math

        ✔ plus

      1 passing (1ms)

## Modularization

Since JS++ only allows one "[main file](https://docs.onux.com/en-US/Developers/JavaScript-PP/Language-Guide/main-file)", it is highly recommended you define your test suites using modules:

	module Vendor.MyCompany.MyApp.Tests.Tests1
	{
		public void queue() {
			suite("My test suite", void() {
				/* ... */
			});
		}
	}

You can then execute all of your modularized tests by importing them into the main file and calling `JSPPUnit.run`:

	import Vendor.JSPPUnit;
	import Vendor.MyCompany.MyApp.Tests.Tests1;
	import Vendor.MyCompany.MyApp.Tests.Tests2;

	Tests1.queue();
	Tests2.queue();

	JSPPUnit.run();

## License

MIT License