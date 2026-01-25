# kindling-stick-fighter

> # Kindling - AI-Customizable Stick Fighting Game

A minimalist stick-figure fighting game with fire-themed mechanics, percentage-based knockback, and AI-driven character customization. Sticks are fuel. Combat is combustion. 🔥

## 🎮 Quick Start

**Ready to play!** The MVP is fully implemented and playable.

### For Players

1. **Install Godot 4.2+** from https://godotengine.org/download
2. **Open the project**: Import `godot/project.godot` in Godot
3. **Press F5** to run the game
4. **See [godot/QUICKSTART.md](./godot/QUICKSTART.md)** for detailed instructions

### Controls

- **Player 1**: WASD to move, Space to jump, J to attack
- **Player 2**: Arrow keys or controller, Numpad 0 to jump, Numpad 1 to attack

Full controls in [godot/CONTROLS.md](./godot/CONTROLS.md)

## 🔥 Core Features (MVP Complete)

✅ **Two-Tiered Core Health**
- Outer Core (orange) + Inner Core (red)
- Inner Core exposed = 1.5x knockback multiplier

✅ **Kindle System**
- Special meter that fills during combat
- Decays when idle

✅ **Percentage-Based Knockback**
- Higher damage = farther launch
- Ring-out victory conditions

✅ **Local Two-Player**
- Keyboard + controller support
- The Hearth stage

✅ **Full Movement System**
- Walk, run, jump, double jump, fast fall

See [IMPLEMENTATION_SUMMARY.md](./IMPLEMENTATION_SUMMARY.md) for complete details.

## Quick Start

See [SIGNAL.md](./SIGNAL.md) for project intent and context.

## Structure

```
├── docs/         # Architecture and documentation
├── plans/        # Phase implementation plans
├── src/          # Source code
└── tests/        # Test files
```

## Phases

This is a **Chord** project with multiple implementation phases:

1. **Phase 1: Foundation** - Core setup and structure
2. **Phase 2: Core** - Main implementation
3. **Phase 3: Integration** - Connect components

See `/plans` for detailed phase documentation.

## Development

This is a Godot 4.2+ game project. The main game files are in the `godot/` directory.

### Running the Game

1. Install Godot 4.2+ from https://godotengine.org/
2. Open the Godot editor
3. Import the project by selecting `godot/project.godot`
4. Press F5 to run

See [godot/README.md](./godot/README.md) for detailed setup and controls.

## Architecture

See [docs/architecture.md](./docs/architecture.md) for system design.

---
*Created by [Legato](https://github.com/bobbyhiddn/Legato.Pit)*
