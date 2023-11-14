#!/bin/sh

# If an error occurs, the abort() function will be called.
#----------------------------------------------------------
abort()
{
    echo >&2 '
*** ABORTED ***
'
    echo >&2 "An error occurred. Exiting..."
    exit 1
}

trap 'abort' 0

set -e

# Process main.py script inside app directory
#----------------------------------------------------------
python main.py ${ALGORITHM_NAME}

# Done!
trap : 0

echo '
*** SUCCESS ***'