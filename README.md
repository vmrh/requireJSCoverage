## Synopsis

Script to generate an html report for RequireJS using Mocha to run unit testing.
It is going to instrument code, saving a backup of your files, run tests generating LCOV file, exclude libraries directory from report, revert your source code, and generate an HTML report to help developer understand your coverage. 

## Motivation

Generate and HTML report from a lcov report file in order to help completing code coverage of javascript code, without changing the way you build your project.

## Installation

Requirements are:
- [NodeJS][node]
- Install modules using packege.json, in this example using Mocha using Sinon + Chai, and Istanbul to instrument code
- [LCOV][lcov]

[node]: http://nodejs.org/
[lcov]: http://ltp.sourceforge.net/coverage/lcov.php

## Running

To generate a complete html summary for Coverage and a `lcov.info` file with summary just run:
	$ ./requirejsCoverage.sh

- Source code has to be located in `src/main/webapp/scripts` 
- Test directory as `src/test/javascript`
- Libraries to be excluded from report `src/main/webapp/scripts/lib/`

Reports are going to be generated in `build/requirejs-reports`

## Example

Source directory as `src/main/webapp/scripts` and test directory as `src/test/javascript` and Javascript test files as `*Test.js`

## Contributing workflow

Here’s how we suggest you go about proposing a change to this project:

1. [Fork this project][fork] to your account.
2. [Create a branch][branch] for the change you intend to make.
3. Make your changes to your fork.
4. [Send a pull request][pr] from your fork’s branch to our `master` branch.

Using the web-based interface to make changes is fine too, and will help you
by automatically forking the project and prompting to send a pull request too.

[fork]: http://help.github.com/forking/
[branch]: https://help.github.com/articles/creating-and-deleting-branches-within-your-repository
[pr]: http://help.github.com/pull-requests/

## License

[MIT](./LICENSE).
