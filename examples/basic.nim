import bossy

## Get the command line arguments, parsed by Bossy
let args = getCommandLineArgs()

## Check if an argument is present
echo "flag" in args

## Get the value for an argument
echo args["port"]

## Get the value for an argument, or use a default value
echo args.getOrDefault("port", "8080")
