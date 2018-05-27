# Bash Argument Parser

Example of how to parse command-line arguments using pure bash.


## Run

Execute the example script:
```bash
$ ./arg_parse.sh
```
This will print what arguments have been passed.


## Argument Types

Arguments come in several flavors:

| Argument Type             | Format                    |
| ------------------------- | ------------------------- |
| short                     | -s <value>                |
| long, space-separated     | --long-argument <value>   |
| long, equals-separated    | --long-argument=<value>   |
| positional                | <value>                   |

Each format must be parsed differently.


### Examples

Short argument:
```bash
$ ./arg_parse.sh -s short_arg
```

Long argument, separated by space:
```bash
$ ./arg_parse.sh --long-argument long_arg_space
```

Long argument, separated by equals:
```bash
$ ./arg_parse.sh --long-argument=long_arg_equals
```

Positional:
```bash
$ ./arg_parse.sh positional_arg_1 positional_arg_2
```

If an argument can be specified using both long and short options, the last value specified takes precedence:
```bash
$ ./arg_parse.sh -a value1 --argument value2
```

This parsing method allows positional arguments to be interspersed between options:
```bash
$ ./arg_parse.sh p1 -s short p2 --long-argument long_space p3 --long-argument=long_equals p4 p5
```

Perhaps this is a flaw in the algorithm - reconsider in the future.


## References

  * Bash argument parsing
    - Primary resourse - [Stack Overflow post](https://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash)
    - [Useful gist](https://gist.github.com/jehiah/855086)
  * Parameter substitution
    - [tldp.org](https://www.tldp.org/LDP/abs/html/parameter-substitution.html)
  * Arrays
    - [GNU Bash Manual](https://www.gnu.org/software/bash/manual/bashref.html#Arrays)
    - [Cheatsheet Gist](https://gist.github.com/magnetikonline/0ca47c893de6a380c87e4bdad6ae5cf7)
  * Shift built-in
    - [tldp.org](http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_09_07.html)
  * Set built-in
    - [GNU Bash Manual](https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html)
