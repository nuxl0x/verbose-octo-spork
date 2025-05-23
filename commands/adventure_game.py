import json

def update_local_data_from_file():
    with open("game_save.json", "r") as file:
        retrieved_data = json.load(file)

    player_data = {
        "name": retrieved_data["playerName"],
        "level": retrieved_data["playerLevel"],
        "inventory": retrieved_data["playerInventory"],
        "asylum": retrieved_data["asylumUnlocked"],
        "bridge": retrieved_data["bridgeUnlocked"],
        "canyon": retrieved_data["canyonUnlocked"],
        "mines": retrieved_data["minesUnlocked"],
        "lava": retrieved_data["lavaUnlocked"],
        "first_session": retrieved_data["firstSession"]
    }
    return player_data
