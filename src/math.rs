use crate::{log, log_error};

pub fn math(args: &Vec<String>) {
    let x = match args[3].parse::<i32>() {
        Ok(n) => n,
        Err(_) => { log_error("Invalid number input. You must input an integer."); return }
    };
    let y = match args[4].parse::<i32>() {
        Ok(n) => n,
        Err(_) => { log_error("Invalid number input. You must input an integer."); return }
    };
    let result = match args[2].as_str() {
        "add" => x + y,
        "sub" => x - y,
        "mul" => x * y,
        "div" => x / y,
        "mod" => x % y,
        _ => { log_error("Invalid mathematical operation selected."); return }
    };
    let result = format!("Result: {}", result);
    log(result.as_str());

}