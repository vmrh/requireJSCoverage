#!/bin/bash

MOCHA=node_modules/.bin/mocha
ISTANBUL=node_modules/.bin/istanbul

# test files must end with "Test.js"
TESTS=`find src/test/javascript -name "*Test.js"`

if [ -d build/requirejs-reports ]; then
	rm -rf build/requirejs-reports/*
else
	mkdir build/requirejs-reports
fi

echo "Instrumenting javascript source files from src/main/webapp/scripts"
${ISTANBUL} instrument --output src/main/webapp/scripts-cov src/main/webapp/scripts

# move original lib code and replace it by the instrumented one
mv src/main/webapp/scripts src/main/webapp/scripts-orig
mv src/main/webapp/scripts-cov src/main/webapp/scripts

# tell istanbul to only generate the lcov file
echo "Running tests"
ISTANBUL_REPORTERS=lcovonly ${MOCHA} -R mocha-istanbul ${TESTS}

# Remove libraries from report and place the lcov report in the report folder
echo "Removing script/lib directory because are external dependencies"
lcov -r lcov.info src/main/webapp/scripts/lib/\* -o build/requirejs-reports/lcov.info
rm lcov.info

# remove instrumented code and put back lib at its place
rm -rf src/main/webapp/scripts
mv src/main/webapp/scripts-orig src/main/webapp/scripts

# Generate HTML report	
echo "Generate HTML report"
genhtml build/requirejs-reports/lcov.info --output-directory build/requirejs-reports/
