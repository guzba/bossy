import std/parseopt, std/os, std/typetraits

type CommandLineArgs* = distinct seq[(string, string)]

converter toBase*(args: var CommandLineArgs): var seq[(string, string)] =
  args.distinctBase

converter toBase*(args: CommandLineArgs): lent seq[(string, string)] =
  args.distinctBase

proc `[]`*(args: CommandLineArgs, key: string): string =
  ## Get a key out of the args. Case-sensitive.
  ## Returns an empty string if key is not present.
  ## Use a for loop to get duplicate keys.
  for (k, v) in args.toBase:
    if k == key:
      return v

proc contains*(args: CommandLineArgs, key: string): bool =
  ## Returns true if key is in the args. Case-sensitive.
  for pair in args:
    if pair[0] == key:
      return true

proc getOrDefault*(args: CommandLineArgs, key, default: string): string =
  ## Retrieves the value for key if it is in args, otherwise `default` is returned.
  ## Note, if key is present in args but the value is an empty string, that
  ## empty string will be returned instead of `default`.
  if key in args:
    result = args[key]
  else:
    result = default

proc getCommandLineArgs*(): CommandLineArgs =
  ## Returns the parsed command line arguments. See
  ## https://nim-lang.org/docs/parseopt.html for the supported syntax.
  var opt = initOptParser(quoteShellCommand(commandLineParams()))
  while true:
    opt.next()
    case opt.kind:
    of cmdEnd:
      break
    of cmdShortOption, cmdLongOption:
      result.add((opt.key, opt.val))
    of cmdArgument:
      result.add((opt.key, ""))
