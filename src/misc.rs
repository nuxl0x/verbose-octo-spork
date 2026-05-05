use crate::log;

pub fn cmds() {
    let commands = "
[VOS] verbose-octo-spork / Command List
=======================================
- adventure-game | Play a built-in adventure game.
- cmds | View list of commands.
- credits | View VOS credits.
- man | View manual page.
- math | Perform mathematical operation.
- uninstall | Uninstall VOS.
- version | View VOS version.
=======================================
Use 'vos man <command>' in order to see information and usage about every command.";
    println!("{}", commands);
}

pub fn credits() {
    let credits = format!("
[VOS] verbose-octo-spork / Credits
=======================================
Created by: nuxl0x.
Version: {}
Licensed under the GPL-3.0 license.

verbose-octo-spork is a CLI that is written in Rust.
This utility is open-source and, due to the license, will always remain as such into the future.
Please make sure to let me know if you have any issues or feedback on Github.

This is one of my first projects and I would really appreciate the feedback!

All work relating to this project has been done entirely by the credited developer/s and them only.
This is the original version of this project.

Please make sure to enjoy using my project, let me know if you have any suggestions for commands to be implemented in the future.
=======================================", env!("CARGO_PKG_VERSION"));
    println!("{}", credits);
}

pub fn version() { println!("VOS / verbose-octo-spork | v{}", env!("CARGO_PKG_VERSION")); }

pub fn help() {
    log("Usage: vos <command> [args...]");
    log("Run 'vos cmds' to view all commands.")
}