#!/bin/bash

set -e

# error(){
#     echo "There is an error in $LINENO, Command is: $BASH_COMMAND"
# }
trap 'echo "There is an error in $LINENO, Command is: $BASH_COMMAND"' ERR

echo "Hello.."
echo "Before error.."
abcdefgh
echo "After error"