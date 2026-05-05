use crate::{log};

const ADVENTURE_GAME: &str = "
[VOS] verbose-octo-spork / Manual / adventure-game
=======================================
Syntax: (vos) adventure-game

This command can be used to start a command-line based choose-your-own adventure game where you are able to explore lots of different paths.

There is a lot of different things to do in this game and the game will expand with every single update. All progress will save across updates.
=======================================
Use 'cmds' in order to view other commands.";

const CMDS: &str = "
[VOS] verbose-octo-spork / Manual / cmds
=======================================
Syntax: (vos) cmds

Lists all available commands.
=======================================
Use 'cmds' in order to view other commands.";

const CREDITS: &str = "[VOS] verbose-octo-spork / Manual / credits
=======================================
Syntax: (vos) credits

This is a simple command that will view the VOS credits.
(Please check it out at some point!)
=======================================
Use 'cmds' in order to view other commands.";

const MAN: &str = "
[VOS] verbose-octo-spork / Manual / man
=======================================
Syntax: (vos) man <command>

In order to be viewing this page, you, ironically, have to be using the 'man' command.
The 'man' command allows you to view a manual on the arguments and how to use any given command.
In this instance, you have viewing the manual on the manual command.
=======================================
Use 'cmds' in order to view other commands.";

const MATH: &str = "
[VOS] verbose-octo-spork / Manual / math
=======================================
Syntax: (vos) math <operator> <number> <number> <custom>

Operators:
- add ( + )
- sub ( - )
- mul ( * )
- div ( / )
- mod ( % )

=======================================
Use 'cmds' in order to view other commands.";

const UNINSTALL: &str = "
[VOS] verbose-octo-spork / Manual / uninstall
=======================================
Syntax: (vos) uninstall

This command will completely uninstall VOS from your device.
=======================================
Use 'cmds' in order to view other commands.";

const VERSION: &str = "
[VOS] verbose-octo-spork / Manual / version
=======================================
Syntax: (vos) version

Prints out the current version of VOS that you have installed.
=======================================
Use 'cmds' in order to view other commands.";


pub fn man(args: &Vec<String>) {
    let manual_command = &args[2];
    match manual_command.as_str() {
        "adventure-game" => println!("{}", ADVENTURE_GAME),
        "cmds" => println!("{}", CMDS),
        "credits" => println!("{}", CREDITS),
        "man" => println!("{}", MAN),
        "math" => println!("{}", MATH),
        "uninstall" => println!("{}", UNINSTALL),
        "version" => println!("{}", VERSION),
        _ => { log("Command does not exist or does not have a manual."); return }
    }
}