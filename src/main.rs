mod misc;
mod adventure_game;
mod uninstall;
mod math;
mod man;

use std::env;

fn log(message: &str) { println!("[VOS] {message}"); }
fn log_error(message: &str) { println!("[VOS ERROR] {message}"); }


fn main() {
    let args: Vec<String> = env::args().collect();

    if args.len() == 1 {
        misc::help();
        return
    }

    let first_arg = args[1].as_str();

    match first_arg {
        "adventure-game" => adventure_game::adventure_game(),
        "cmds" => misc::cmds(),
        "credits" => misc::credits(),
        "man" => man::man(&args),
        "math" => math::math(&args),
        "uninstall" => uninstall::uninstall(),
        "version" => misc::version(),
        _ => {
            let error_message = format!("Command '{}' not found.", first_arg);
            log_error(error_message.as_str());
            log("If you believe that this is an error, please make a report on Github.");
            println!();
            misc::help()
        },
    }
}
