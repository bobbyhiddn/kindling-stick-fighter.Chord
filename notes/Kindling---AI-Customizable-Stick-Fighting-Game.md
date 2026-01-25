# Kindling - AI-Customizable Stick Fighting Game

A minimalist stick-figure fighting game with fire-themed mechanics, percentage-based knockback, and AI-driven character customization. Sticks are fuel. Combat is combustion.

---

## Core Vision

**Phase 1: Pure Stick Combat**
- Two stick figures, clean animations, tight controls
- Percentage accumulates with hits → higher % = further knockback
- Two-tiered Core HP bar (single bar, two colors)
- Kindle ability gauge (fills during combat, spends on specials)
- Ring-out victory conditions (launched off stage)
- Controller + keyboard parity from day one
- Local two-player → Steam Link for remote multiplayer

**Phase 2: AI Customization Layer** (future)
- In-game currency economy
- Templated ability library
- AI modifies templates to generate unique characters

---

## Fire Theme

- Knockback = "Launch"
- KO = "Ignition" 
- Charging = "Stoking"
- Special meter = "Kindle"
- Health layers = "Core" (outer/inner)

---

## Core Bar: Two-Tiered HP (Single Bar)

A single health bar with two color-coded layers:

```
[████████████████████████████████████]
 ^^^^^^^^^^^^^^^  ^^^^^^^^^^^^^^^^^^^
   OUTER CORE        INNER CORE
   (orange/yellow)   (deep red/ember)
```

### Mechanics
1. **Outer Core** (~50%): Lighter color, absorbs initial damage, moderate KB scaling
2. **Inner Core** (~50%): Darker/red, **1.5x knockback multiplier** when exposed

### Strategic Implications
- Breaking through to Inner Core = opponent is vulnerable
- Inner Core hits launch much further
- Creates natural momentum swings

---

## Kindle System: Ability Gauge

```
KINDLE [░░░░░░░░░░████████████] 60%
```

### How It Fills
- Landing hits (scales with damage)
- Taking damage (comeback mechanic)
- Charging attacks

### How It Spends
- **Specials cost Kindle** (no free specials)
- Decays slowly when idle (~2/sec after 3 sec)
- Both players see each other's Kindle

---

## Weight Classes

| Class | Speed | KB Dealt | KB Received | Kindle Gain |
|-------|-------|----------|-------------|-------------|
| **Tinder** | Fast | Low | High | Fast |
| **Firewood** | Normal | Normal | Normal | Normal |
| **Hardwood** | Slow | High | Low | Slow |

### Knockback Formula
```
base_kb = attack_base_kb + (total_damage% * kb_scaling)
if inner_core_exposed: base_kb *= 1.5
final_kb = base_kb * (1 / weight_modifier)
```

---

## Technical Spec

### Engine: Godot 4.2+

### Project Structure
```
kindling/
├── scenes/{main, characters/stick, stages/hearth, ui/hud}
├── scripts/
│   ├── core/{game_manager, input_manager, audio_manager}
│   ├── characters/{stick_base, state_machine, states/}
│   └── systems/{core_health, kindle_system, knockback, hitbox_manager}
└── resources/{attacks/, characters/}
```

### Core Health System
```gdscript
class_name CoreHealth extends Node

const OUTER_MAX: float = 50.0
const INNER_MAX: float = 50.0
const INNER_KB_MULT: float = 1.5

var outer_core: float = OUTER_MAX
var inner_core: float = INNER_MAX
var total_damage: float = 0.0

signal health_changed(outer: float, inner: float, total: float)
signal inner_core_exposed()

func take_damage(amount: float) -> void:
    total_damage += amount
    if outer_core > 0:
        var overflow = max(0, amount - outer_core)
        outer_core = max(0, outer_core - amount)
        if overflow > 0:
            inner_core = max(0, inner_core - overflow)
            inner_core_exposed.emit()
    else:
        inner_core = max(0, inner_core - amount)
    health_changed.emit(outer_core, inner_core, total_damage)

func is_inner_exposed() -> bool:
    return outer_core <= 0

func get_kb_multiplier() -> float:
    return INNER_KB_MULT if is_inner_exposed() else 1.0
```

### Kindle System
```gdscript
class_name KindleSystem extends Node

const KINDLE_MAX: float = 100.0
const DECAY_RATE: float = 2.0
const DECAY_DELAY: float = 3.0

var kindle: float = 0.0
var time_since_action: float = 0.0

signal kindle_changed(value: float)

func add_kindle(amount: float) -> void:
    kindle = min(KINDLE_MAX, kindle + amount)
    time_since_action = 0.0
    kindle_changed.emit(kindle)

func spend_kindle(cost: float) -> bool:
    if kindle >= cost:
        kindle -= cost
        kindle_changed.emit(kindle)
        return true
    return false

func can_afford(cost: float) -> bool:
    return kindle >= cost
```

### Attack Data Resource
```gdscript
class_name AttackData extends Resource

@export var name: String
@export var startup_frames: int
@export var active_frames: int
@export var recovery_frames: int
@export var base_damage: float
@export var base_knockback: float
@export var knockback_angle: float
@export var knockback_scaling: float
@export var kindle_gain: float
@export var kindle_cost: float = 0
@export var hitbox_offset: Vector2
@export var hitbox_size: Vector2
```

### Physics Constants
```gdscript
const WALK_SPEED: float = 300.0
const RUN_SPEED: float = 500.0
const GRAVITY: float = 1800.0
const JUMP_VELOCITY: float = -600.0
const DOUBLE_JUMP_VELOCITY: float = -550.0
const HITSTUN_BASE: int = 10
const DI_INFLUENCE: float = 15.0
```

---

## Vanilla Stick Moveset

### Grounded Attacks
| Move | Startup | Active | Recovery | Damage | KB° | Kindle |
|------|---------|--------|----------|--------|-----|--------|
| Jab 1 | 3 | 2 | 8 | 3 | 60 | 2 |
| Jab 2 | 3 | 2 | 8 | 3 | 70 | 2 |
| Jab 3 | 4 | 3 | 15 | 5 | 45 | 4 |
| F-Tilt | 7 | 4 | 14 | 9 | 40 | 6 |
| U-Tilt | 6 | 5 | 12 | 8 | 85 | 5 |
| D-Tilt | 5 | 3 | 10 | 7 | 30 | 5 |
| F-Smash | 14 | 3 | 22 | 16 | 45 | 12 |
| U-Smash | 12 | 4 | 20 | 15 | 90 | 10 |
| D-Smash | 10 | 6 | 24 | 13 | 30 | 10 |

### Aerial Attacks
| Move | Startup | Active | Recovery | Damage | KB° | Kindle |
|------|---------|--------|----------|--------|-----|--------|
| Nair | 5 | 12 | 10 | 8 | 50 | 5 |
| Fair | 8 | 3 | 16 | 12 | 45 | 8 |
| Bair | 6 | 3 | 14 | 14 | 135 | 9 |
| Uair | 5 | 4 | 12 | 10 | 80 | 6 |
| Dair | 12 | 4 | 20 | 14 | 270 | 10 |

### Specials (Cost Kindle)
| Move | Cost | Effect |
|------|------|--------|
| N-Special: Ember Shot | 15 | Projectile |
| S-Special: Flame Dash | 20 | Dash + i-frames |
| U-Special: Rising Cinder | 25 | Recovery |
| D-Special: Smolder | 10 | Counter |

---

## Stage: The Hearth

Flat competitive stage (Final Destination style).
- Platform: 800 units wide
- Blast zones: 400 units beyond edges
- Spawn points: 200 units from center

---

## MVP Scope

### Must Have
- [ ] One stick, full moveset
- [ ] Movement: walk, run, jump, double jump, fast fall
- [ ] Core bar (two-tiered single bar with colors)
- [ ] Kindle gauge (fills on hit/hurt, spends on specials)
- [ ] Knockback with Inner Core 1.5x multiplier
- [ ] One stage (The Hearth)
- [ ] Local two-player
- [ ] Keyboard + controller
- [ ] HUD (Core bar, Kindle, damage %)

### Out of Scope
- AI character generation
- Currency system
- Multiple characters
- Online multiplayer

---

*Kindling: where every match is a slow burn until someone ignites.*