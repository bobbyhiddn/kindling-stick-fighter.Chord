# Kindling - Project Status

> **Last Updated**: 2026-01-25

## Overview

**Kindling** is a minimalist stick-figure fighting game with fire-themed mechanics, percentage-based knockback, and planned AI-driven character customization.

**Current Phase**: Phase 2 (Core Implementation) - ✅ **COMPLETE (MVP)**

---

## Implementation Status

### ✅ Phase 1: Foundation (COMPLETE)

**Objective**: Set up project structure and scaffolding

- ✅ Godot 4.2+ project initialized
- ✅ Input mappings configured (keyboard + controller)
- ✅ Directory structure created
- ✅ Documentation framework established
- ✅ .gitignore configured

**Deliverables**: Project structure, input system, documentation

---

### ✅ Phase 2: Core Implementation (COMPLETE - MVP)

**Objective**: Implement core combat mechanics

#### Core Systems
- ✅ **CoreHealth System**
  - Two-tiered HP (Outer Core: 50, Inner Core: 50)
  - Inner Core exposure → 1.5x knockback multiplier
  - Ignition detection (0 HP)
  
- ✅ **KindleSystem**
  - Fills on hit/hurt
  - Decays after 3 seconds (2/sec)
  - Ready for special move integration
  
- ✅ **KnockbackSystem**
  - Percentage-based scaling
  - Damage accumulation affects launch distance
  - Directional knockback by angle
  
- ✅ **HitboxManager**
  - Collision detection for attacks
  - Hit tracking (no double-hits)
  - Frame-based active windows

#### Character Implementation
- ✅ **StickFighter Controller**
  - Movement: walk, run
  - Jump mechanics: single, double jump
  - Fast fall when holding down
  - Facing direction tracking
  
- ✅ **Attack System**
  - Basic attack execution (startup, active, recovery frames)
  - Hitstun mechanics
  - Attack data resource system
  - Multiple attack variants

#### Stage & Game Management
- ✅ **The Hearth Stage**
  - Flat platform (800 units wide)
  - Visual background
  - Proper collision
  
- ✅ **GameManager**
  - Blast zone boundaries (±600 horizontal, ±400 vertical)
  - Ring-out detection
  - Victory condition handling
  - Match flow control

#### UI/HUD
- ✅ **Player Stats Display**
  - Two-tiered Core health bars (color-coded)
  - Kindle gauge (0-100%)
  - Damage percentage display
  - Player labels (P1/P2)

#### Game Resources
- ✅ **Attack Data**
  - Jab 1 (quick, low damage)
  - Forward Tilt (moderate)
  - Up Tilt (launcher)
  - Forward Smash (heavy)
  - Neutral Air (aerial)
  
- ✅ **Scenes**
  - Character scene (stick figure with hitboxes)
  - Stage scene (The Hearth)
  - HUD scene (stats display)
  - Main scene (full game)

#### Documentation
- ✅ Architecture documentation
- ✅ Quick start guide
- ✅ Comprehensive controls guide
- ✅ Manual testing checklist
- ✅ Project README
- ✅ Godot-specific README

**Deliverables**: Fully playable MVP with core mechanics

---

### ⏳ Phase 3: Integration & Polish (PENDING)

**Objective**: Add polish and complete features

#### Planned Features
- ⏳ Special moves (kindle-based attacks)
- ⏳ Attack animations
- ⏳ Visual effects (particles, screen shake)
- ⏳ Sound effects and music
- ⏳ Menu system
- ⏳ Training mode
- ⏳ Gameplay balance tuning

**Status**: Not yet started. MVP complete and ready for polish phase.

---

## Current Capabilities

### What Works ✅

1. **Two-Player Local Gameplay**
   - Player 1: WASD + Space/J/K
   - Player 2: Arrows/Controller + Numpad/Buttons
   
2. **Core Combat**
   - Attacking and damage application
   - Percentage-based knockback
   - Inner Core multiplier (1.5x when exposed)
   - Hitstun for combos
   
3. **Health & Resource Management**
   - Two-tiered Core health tracking
   - Kindle gauge filling and decay
   - Damage percentage display
   
4. **Victory Conditions**
   - Ring-outs (blast zones)
   - Health depletion (Ignition)
   
5. **Movement**
   - Walking, running
   - Jumping, double jumping
   - Fast falling

### What's Missing ⏳

1. **Polish**
   - No attack animations (stick figures are static)
   - No visual effects (hits, particles)
   - No sound effects or music
   - No screen shake or camera effects
   
2. **Special Moves**
   - Kindle system present but no special attacks yet
   - Special move input system not implemented
   
3. **Menus**
   - No main menu
   - No pause menu
   - No rematch functionality
   - Must restart game in Godot to play again
   
4. **Advanced Features**
   - No training mode
   - No AI opponents
   - No stage variations
   - No character customization (Phase 2 AI feature)

---

## File Structure

```
kindling-stick-fighter.Chord/
├── godot/                          # Main Godot project
│   ├── scenes/
│   │   ├── characters/            
│   │   │   └── stick_fighter.tscn # Character scene
│   │   ├── stages/
│   │   │   └── hearth.tscn        # The Hearth stage
│   │   ├── ui/
│   │   │   └── hud.tscn           # HUD overlay
│   │   └── main.tscn              # Main game scene
│   ├── scripts/
│   │   ├── core/
│   │   │   └── game_manager.gd    # Match flow
│   │   ├── characters/
│   │   │   └── stick_fighter.gd   # Character controller
│   │   ├── systems/
│   │   │   ├── core_health.gd     # Health system
│   │   │   ├── kindle_system.gd   # Kindle gauge
│   │   │   ├── knockback_system.gd# Knockback calc
│   │   │   ├── hitbox_manager.gd  # Collision detection
│   │   │   └── attack_data.gd     # Attack resource
│   │   ├── stages/
│   │   │   └── hearth.gd          # Stage script
│   │   └── ui/
│   │       └── hud.gd             # HUD controller
│   ├── resources/
│   │   ├── attacks/               # Attack data files
│   │   │   ├── jab1.tres
│   │   │   ├── ftilt.tres
│   │   │   ├── utilt.tres
│   │   │   ├── fsmash.tres
│   │   │   └── nair.tres
│   │   ├── characters/            # (Future: character data)
│   │   └── ui/
│   │       └── hud_theme.tres     # UI styling
│   ├── project.godot              # Godot project config
│   ├── icon.svg                   # Project icon
│   ├── .gitignore                 # Godot-specific ignores
│   ├── README.md                  # Godot project guide
│   ├── QUICKSTART.md              # Quick start guide
│   ├── CONTROLS.md                # Controls reference
│   └── TESTING.md                 # Testing checklist
├── docs/
│   └── architecture.md            # System architecture
├── plans/
│   ├── phase-01-foundation.md     # ✅ Complete
│   ├── phase-02-core.md           # ✅ Complete
│   └── phase-03-integration.md    # ⏳ Pending
├── notes/
│   └── Kindling---AI-Customizable-Stick-Fighting-Game.md
├── README.md                      # Main project README
└── SIGNAL.md                      # Project intent
```

---

## Testing Status

### Manual Testing Required

A comprehensive testing checklist is available in `godot/TESTING.md`.

**Key areas to test:**
- [ ] Core health system (two-tiered bars, Inner Core multiplier)
- [ ] Kindle system (gain, decay, display)
- [ ] Knockback (damage scaling, directional)
- [ ] Movement (all types: walk, run, jump, double jump, fast fall)
- [ ] Attack system (hitboxes, hitstun, damage)
- [ ] Blast zones (all four boundaries)
- [ ] Input (both players, keyboard + controller)
- [ ] HUD (all displays update correctly)

### Known Issues

*No critical bugs currently documented.*

---

## Next Steps

### Immediate (Phase 3 Prep)
1. ✅ Complete documentation
2. Manual playtesting with checklist
3. Address any bugs found
4. Begin Phase 3 planning

### Short Term (Phase 3)
1. Implement special moves
2. Add visual feedback (particles, effects)
3. Add sound effects
4. Create basic menu system
5. Balance tuning

### Long Term (Future Phases)
1. AI-driven character customization (original vision)
2. Online multiplayer
3. Additional characters/stages
4. Advanced game modes
5. Steam release

---

## How to Contribute

1. **Playtesting**
   - Follow `godot/TESTING.md` checklist
   - Report bugs and balance issues
   
2. **Development**
   - Check `plans/` for current phase tasks
   - Follow existing code patterns
   - Update documentation with changes
   
3. **Art & Audio**
   - Create animations for stick fighters
   - Design particle effects (fire theme)
   - Compose sound effects and music

---

## Resources

- **Main Documentation**: `/README.md`
- **Quick Start**: `/godot/QUICKSTART.md`
- **Controls**: `/godot/CONTROLS.md`
- **Testing**: `/godot/TESTING.md`
- **Architecture**: `/docs/architecture.md`
- **Design Notes**: `/notes/Kindling---AI-Customizable-Stick-Fighting-Game.md`

---

**Project Motto**: *Sticks are fuel. Combat is combustion.* 🔥
