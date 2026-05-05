mod misc;
mod adventure_game;
mod uninstall;
mod math;
mod man;

use std::env;

fn log(message: &str) { println!("[VOS] {message}"); }
fn log_error(message: &str) { eprintln!("[VOS ERROR] {message}"); }


fn main() {
    let args: Vec<String> = env::args().collect();

    if args.len() == 1 {
        misc::help();
        return
    }

    let command = args[1].as_str();

    match command {
        "adventure-game" => adventure_game::adventure_game(),
        "cmds" => misc::cmds(),
        "credits" => misc::credits(),
        "man" => man::man(&args),
        "math" => math::math(&args),
        "uninstall" => uninstall::uninstall(),
        "version" => misc::version(),
        _ => {
            let error_message = format!("Command '{command}' not found.");
            log_error(error_message.as_str());
            log("If you believe that this is an error, please make a report on Github.");
            println!();
            misc::help()
        },
    }
}
