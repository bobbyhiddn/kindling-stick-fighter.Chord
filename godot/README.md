# Kindling - Godot Project

This is the main Godot 4.2+ project for the Kindling stick fighting game.

## Setup

1. Install Godot 4.2 or later from https://godotengine.org/
2. Open Godot and import this project by selecting the `project.godot` file
3. Press F5 to run the game

## Controls

### Player 1 (Keyboard - WASD)
- **Movement**: W/A/S/D
- **Jump**: Space
- **Attack**: J
- **Special**: K

### Player 2 (Arrow Keys or Controller)
- **Movement**: Arrow Keys or Left Stick
- **Jump**: Numpad 0 or A Button
- **Attack**: Numpad 1 or X Button
- **Special**: Numpad 2 or Y Button

## Project Structure

```
godot/
├── scenes/
│   ├── characters/     # Character scenes
│   ├── stages/         # Stage scenes
│   ├── ui/            # UI/HUD scenes
│   └── main.tscn      # Main game scene
├── scripts/
│   ├── core/          # Game management scripts
│   ├── characters/    # Character scripts
│   ├── systems/       # Game systems (health, kindle, knockback)
│   └── ui/            # UI scripts
└── resources/
    ├── attacks/       # Attack data resources
    └── characters/    # Character data resources
```

## Core Systems

### Core Health System
- Two-tiered HP bar (Outer Core + Inner Core)
- Inner Core exposed grants 1.5x knockback multiplier
- Damage accumulates and increases knockback

### Kindle System
- Special meter that fills on hit/hurt
- Required to use special attacks
- Decays slowly when idle

### Knockback System
- Percentage-based knockback scaling
- Higher damage = further knockback
- Ring-out victory conditions

## MVP Features Implemented

- ✅ Two-player local gameplay
- ✅ Keyboard and controller support
- ✅ Core Health system (two-tiered)
- ✅ Kindle gauge system
- ✅ Basic stick fighter character
- ✅ Movement (walk, run, jump, double jump, fast fall)
- ✅ The Hearth stage with blast zones
- ✅ HUD with health, kindle, and damage display
- ✅ Game manager with match flow

## Next Steps

To extend the MVP:
1. Implement full attack system with hitboxes
2. Add attack animations
3. Create more attack data resources
4. Add special moves
5. Implement sound effects
6. Add visual effects (particle systems)
7. Create menu system
