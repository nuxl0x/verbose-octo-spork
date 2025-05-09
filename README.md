# VOS | verbose-octo-spork
Verbose Octo Spork, better referred to as <b>VOS</b>, is a multi-use utility that allows a user to access a wide variety of malicious and non-malicious functions all through a single program responsible for managing and handling all the smaller utilities used.

> [!WARNING]
> The software developer holds absolutely zero responsibility for any malicious actions that people may take through the usage of this software. Any and all actions that are a result of this software are the responsiblity of the user responsible for those actions and them only.

By itself, <b>VOS</b> does not actually contain any inherent functionality. It is simply a wrapper to simplify using a large suite of utilities by making them all accessible in a single place.

> [!NOTE]
> This software has been created and tested on Arch Linux. Please open any issues if there are problems due to combatability.
> </br>This program will NOT function on Windows machines.

## Included Commands
`scan`
`math`
`install-dependencies`
`cmdlist`

## Command Syntax
### ```vos <command> <flags> <parameters>```

All commands that use <b>VOS</b> start with the prefix of `vos`. This indicates that the following command is being handled by the <b>VOS</b> utility. Following this, you have to include the paramaters that tell the application what you would like to do.

Run `vos cmdlist` to list all commands.

## Dependencies
> [!NOTE]
> All dependencies will be installed by <b>VOS</b> automatically after installing the program. All you have to do is run the command `vos install-dependencies`.
> </br>This will re-install any of the utilities that you already have and install the new ones using your local package manager.

- Nmap (Not implemented.)
