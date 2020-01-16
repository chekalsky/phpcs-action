#!/bin/sh

cp /action/problem-matcher.json /github/workflow/problem-matcher.json

echo "::add-matcher::${RUNNER_TEMP}/_github_workflow/problem-matcher.json"

if [ -z "${INPUT_ENABLE_WARNINGS}" ] || [ "${INPUT_ENABLE_WARNINGS}" = "false" ]; then
    echo "Check for warnings disabled"

    phpcs --report=checkstyle
else
    echo "Check for warnings enabled"

    phpcs -w --report=checkstyle
fi

status=$?

echo "::remove-matcher owner=phpcs::"

exit $status
