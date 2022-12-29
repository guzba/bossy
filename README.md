# Bossy

`nimble install bossy`

![Github Actions](https://github.com/guzba/bossy/workflows/Github%20Actions/badge.svg)

[API reference](https://nimdocs.com/guzba/bossy)

Bossy is a simple repo that makes working with command line arguments a little easier.

All Bossy does is parse the command line arguments using [std/parseopt](https://nim-lang.org/docs/parseopt.html) and give you a simpler interface to work with.

Bossy is great for supporting command line parameters without any magic.

If you want a powerful library for building command line interfaces, Bossy currently isn't that. There are other options on [Nimble](https://nimble.directory/).

## Example

```nim
import bossy

## Get the command line arguments, parsed by Bossy
let args = getCommandLineArgs()

## Check if an argument is present
echo "flag" in args

## Get the value for an argument
echo args["port"]

## Get the value for an argument, or use a default value
echo args.getOrDefault("port", "8080")
```
