# Kindling - Quick Start Guide

Welcome to **Kindling**, a minimalist stick-figure fighting game with fire-themed mechanics!

## Installation

### Prerequisites
- **Godot Engine 4.2 or later**
  - Download from: https://godotengine.org/download

### Setup Steps

1. **Clone or download this repository**
   ```bash
   git clone https://github.com/bobbyhiddn/kindling-stick-fighter.Chord.git
   cd kindling-stick-fighter.Chord
   ```

2. **Open in Godot**
   - Launch the Godot Engine
   - Click "Import"
   - Navigate to the `godot/` folder in this repository
   - Select `project.godot`
   - Click "Import & Edit"

3. **Run the game**
   - Press **F5** in the Godot editor
   - Or click the "Play" button (▶️) in the top-right corner

## First Match

### Goal
Launch your opponent off the stage to win! The further outside the blast zones they go, the more "Ignited" they become.

### Core Mechanics in 60 Seconds

1. **Core Health**: Two-tiered health bar
   - Outer Core (orange): Normal defense
   - Inner Core (red): 1.5x knockback when exposed

2. **Kindle Meter**: Special energy gauge
   - Fills as you fight
   - Use for special moves (future feature)

3. **Damage %**: Higher damage = farther knockback
   - Watch your percentage!
   - Opponents with high % are vulnerable

4. **Ring-Out**: Get launched beyond blast zones = Ignition (you lose!)

### Basic Controls

**Player 1 (WASD + Space/J/K)**
- Move: WASD
- Jump: Space
- Attack: J

**Player 2 (Arrows or Controller)**
- Move: Arrow Keys or Left Stick
- Jump: Numpad 0 or A Button  
- Attack: Numpad 1 or X Button

*See [CONTROLS.md](./CONTROLS.md) for full controls*

## Your First Fight

1. **Start the game** (F5 in Godot)
2. **Player 1 is on the left**, Player 2 on the right
3. **Move around** with WASD (P1) or Arrows (P2)
4. **Try jumping** with Space (P1) or Numpad 0 (P2)
5. **Attack your opponent** with J (P1) or Numpad 1 (P2)
6. **Watch the damage %** increase
7. **Launch them off stage** to win!

## Strategy Tips

- **Protect your Core**: Once Inner Core is exposed, you're much more vulnerable
- **Build Kindle**: It fills as you fight - save it for crucial moments
- **Center stage control**: Don't get pushed to the edge
- **Combo potential**: Attacks cause hitstun - chain them together!

## What's Next?

This is the **MVP (Minimum Viable Product)** version focusing on core combat mechanics.

### Current Features
✅ Two-player local gameplay  
✅ Keyboard and controller support  
✅ Core health system  
✅ Kindle gauge  
✅ Basic attacks  
✅ Knockback and ring-outs  
✅ The Hearth stage  

### Planned Features (Future)
🔜 Special moves (spend Kindle)  
🔜 More attack variety  
🔜 Animations  
🔜 Visual effects  
🔜 Sound effects  
🔜 Menu system  
🔜 AI opponents  
🔜 Online multiplayer  

## Troubleshooting

**Game won't start?**
- Make sure you have Godot 4.2 or later
- Check that you opened `godot/project.godot`

**Controller not working?**
- Plug in controller before starting
- Check Godot's Input Map settings

**Can't attack?**
- Make sure you're not in hitstun (just got hit)
- Check you're pressing the right button (J for P1)

## Get Involved

Found a bug? Have suggestions? This is an open development project!

See the main [README.md](../README.md) for architecture details and contribution guidelines.

---

**Sticks are fuel. Combat is combustion.** 🔥

Enjoy your match!
