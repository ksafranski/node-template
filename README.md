# Node Template Project

A very simple NodeJS template/seed project built for ES2015 development.

## Components:

* **[Babel](http://babeljs.io/)**: Code transpiler, see `/.babelrc` for config
* **[Mocha](http://mochajs.org/)**: Test runner
* **[Chai](http://chaijs.com/)**: Assertion library
* **[Sinon](http://sinonjs.org/)**: Stubbing and mocking, includes `sinon-chai` for assertions
* **[ESLint](http://eslint.org/)**: Linting, includes `babel-eslint` for ES2015 support
* **[ESDoc](https://esdoc.org/)**: JSDoc parser

## Scripts

A `Makefile` is included for managing build and install tasks. The commands are
then referenced in the `package.json` `scripts` if that is the preferred
task method:

* `all` (default) will run all build tasks
* `start` will run the main script
* `clean` will remove the `/dist` and `/node_modules` directories
* `build` will transpile ES2015 code in `/src` to `/dist`
* `test` will run all spec files in `/test/src`
* `lint` will lint all files in `/src`
* `doc` will run ESDoc on all files in `/src` and output to `/docs`
* `dev` will run...
  * linting, then...
  * tests, then...
  * build/transpile, then...
  * the main script.