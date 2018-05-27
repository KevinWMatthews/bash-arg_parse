#!/usr/bin/env bash

echo "Demonstration of parsing arguments using pure bash"
echo ""
echo "Bash argument list ($#): $@"
echo ""

# $@        List of all arguments
# $#        Number of arguments
# $0        Name of current script
# $1        First argument
# $2        Second argument
# and so on

# Arguments come in several flavors:
#   short                   -s <value>
#   long, space-separated   --long-arg <value>
#   long, equals-separated  --long-art=<value>
#   positional              <value>

# shift is a built-in bash operation.
# It essentially pops the first argument.
# shift takes a single argument - the number of arguments to pop.
# The argument seems unsafe - if there are not enough arguments remaining, bash will hang.

while [[ $# -gt 0 ]]; do
    arg="$1"

    case $arg in
        -s)
            SHORT_ARGUMENT="$2"
            shift               # The argument name and value are space-separated, so bash parses two arguments
            shift
            ;;
        --long-argument)        # This pattern does not match a trailing '='
            LONG_ARGUMENT_SPACE="$2"
            shift
            shift
            ;;
        --long-argument=*)
            # Uses substring removal:
            #   $(var#pattern} - remove the shortest matching part of pattern from the front end of var
            #   See: https://www.tldp.org/LDP/abs/html/parameter-substitution.html
            # In this case, the pattern is anything before (and including) the equals sign: *=
            LONG_ARGUMENT_EQUAL="${arg#*=}"
            shift               # There is no space in this pattern so bash parses a single argument
            ;;
        -a|--argument)
            # Parse either form or both, in which case the last argument wins
            ARGUMENT="$2"
            shift
            shift
            ;;
        -*)
            echo "Unrecognized option: $1"
            exit 1
            ;;
        *)
            # Store positional arguments, say, in an array.
            POSITIONAL+=("$1")
            shift
            ;;
    esac
done

echo "SHORT_ARGUMENT: ${SHORT_ARGUMENT}"
echo "LONG_ARGUMENT_SPACE: ${LONG_ARGUMENT_SPACE}"
echo "LONG_ARGUMENT_EQUAL: ${LONG_ARGUMENT_EQUAL}"
echo "ARGUMENT: ${ARGUMENT}"
echo "POSITIONAL: ${POSITIONAL[@]}"
echo ""

# Restore bash's arguments list from the array
# The set builtin is complicated; there may be another way to do this.
# array[@] expands to all elements of the array
set -- "${POSITIONAL[@]}"
echo "Bash argument list ($#): $@"
