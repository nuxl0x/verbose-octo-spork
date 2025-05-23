import json
from time import sleep


def update_local_data_from_file():
    with open("/usr/local/share/vos/assets/game_save.json", "r") as file:
        retrieved_data = json.load(file)

    player_data = {
        "name": retrieved_data["name"],
        "level": retrieved_data["level"],
        "inventory": retrieved_data["inventory"],
        "asylum": retrieved_data["asylum"],
        "bridge": retrieved_data["bridge"],
        "canyon": retrieved_data["canyon"],
        "mines": retrieved_data["mines"],
        "lava": retrieved_data["lava"],
        "first_session": retrieved_data["first_session"]
    }
    return player_data


def save_local_data_to_file(data_to_save):
    with open("/usr/local/share/vos/assets/game_save.json", "w") as file:
        json.dump(data_to_save, file, indent=4)
    print("[VOS] Saved data to file...")


def intro(plr_data):
    print("===============================================")
    print("Welcome, to the choose-your-own adventure game!")
    if plr_data["first_session"] == "true":
        plr_data["first_session"] = "false"
        chosen_name = input("Pick a name for your character: ")
        plr_data["name"] = chosen_name
        print("Welcome, {}!".format(chosen_name))
        save_local_data_to_file(plr_data)
    action = input(
        "Pick a direction you would like to head in, towards the rugged mountains (m), the river in the forest (r), view your inventory (i) or quit (q): ")
    if action == "m":
        mountain(plr_data)

    elif action == "r":
        river_forest(plr_data)

    elif action == "i":
        print("Inventory:")
        print("Slot 1: {}".format(plr_data["inventory"][0]))
        print("Slot 2: {}".format(plr_data["inventory"][1]))
        print("Slot 3: {}".format(plr_data["inventory"][2]))
        print("Slot 4: {}".format(plr_data["inventory"][3]))
        print("Slot 5: {}".format(plr_data["inventory"][4]))
        print("Slot 6: {}".format(plr_data["inventory"][5]))
        print("Slot 7: {}".format(plr_data["inventory"][6]))
        intro(plr_data)

    elif action == "q":
        save_local_data_to_file(plr_data)
        exit(0)

    else:
        print("Invalid option entered. Please try again.")
        intro(plr_data)


def river_forest(plr_data):
    print("You wander slowly through the trees, and the sound of rushing water intensifies.")
    print("The river comes into view. Lush plants surround the pristine clear water.")
    print("It looks so nice... It would be a shame to not take a dip, wouldn't it?")
    river_dip = input("Would you like to take a swim (s) or stay dry (d): ")
    if river_dip == "s":
        print("You step into the river, but something is wrong.")
        print("The water was flowing so smoothly that you hadn't noticed the strong current.")
        print("It's a shame, {}, that you hadn't taken a closer look.".format(plr_data["name"]))
        print("The strong current flips you sideways as you fall into the river and get swept away.")
        print("")
        sleep(2)
        print("The End. You lose.")
        death_action = input("Would you like to restart from the beginning (r), go back to a previous section (p), or quit (q): ")
        if death_action == "r":
            intro(plr_data)

        elif death_action == "p":
            river_forest(plr_data)

        elif death_action == "q":
            save_local_data_to_file(plr_data)
            exit(0)

        else:
            print("Invalid option entered. Please try again.")
            river_forest(plr_data)
    elif river_dip == "d":
        print("It would be nice to go for a swim. Maybe not today.")
        print("Upon closer inspection, it appears that the river had a strong current.")
        print("You may have just saved your own life. How lucky.")
    else:
        print("Invalid option entered. Please try again.")
        river_forest(plr_data)

    print("You continue to walk along, following the river further into the forest.")
    print("The sun slowly sets in the sky, and a cold shiver runs down your spine.")
    print("The End. For now...")
    save_local_data_to_file(plr_data)
    exit(0)

def mountain(plr_data):
    print("You feel a looming presence. This isn't the right way to be going.")
    print("You turn back towards the river.")
    river_forest(plr_data)


data = update_local_data_from_file()
intro(data)
