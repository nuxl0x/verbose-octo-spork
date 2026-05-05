use std::io;
use std::io::Write;
use std::process;
use crate::log_error;

fn input(str: &str) -> String {
    println!("{}", str);
    print!("~> ");
    let _ = io::stdout().flush();
    let mut input = String::new();
    match io::stdin().read_line(&mut input) {
        Ok(_) => input.trim().to_string(),
        Err(_) => { log_error("Failed to read input from user. Exiting."); process::exit(1) }
    }
}

fn river() {
    let text1 = "
You wander slowly through the trees as the sound of rushing water intensifies.
The river comes into view. Lush plants surround the pristine water.
It looks so nice... It'd be a shame to not take a dip, wouldn't it?
    ";
    println!("{text1}");
    let river_dip = input("Would you like to have a swim (s), or stay dry (d)?");
    match river_dip.to_lowercase().as_str() {
        "s" => {
            let swim_text = "
You step into the river, but something is very wrong.
The water had been so smooth that you were not able to see the powerful current.
It's a shame, {}, that you hadn't taken a closer look.
The roaring current sweeps your feet out from under you as you fall into the river, swept away.
            ";
            println!("{swim_text}");
        }
        _ => {}
    }

}

pub fn adventure_game() {
    println!("Welcome, to the choose-your-own adventure game!");

    let name = input("Please choose a name for your character.");
    println!("Welcome, {name}!");

    loop {
        let action = input("Which of the following would you like to do: head towards the mountains (m), venture to the river in a nearby forest (r), or quit (q)?");
        match action.to_lowercase().as_str() {
            "m" => {
                println!("You feel a looming presence. This isn't the right way to be going.\nYou turn back towards the river.");
                river();
            },
            "r" => river(),
            "q" => { println!("Thanks for playing!"); process::exit(0) },
            _ => { println!("You've entered an invalid option! Please try again."); continue },
        }
    }

}