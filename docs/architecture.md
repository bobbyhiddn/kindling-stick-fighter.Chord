# Architecture

## Overview

# Kindling - AI-Customizable Stick Fighting Game

A minimalist stick-figure fighting game with fire-themed mechanics, percentage-based knockback, and AI-driven character customization. Sticks are fuel

## Components

### Core Systems
- **CoreHealth**: Two-tiered health system with Outer Core (50 HP) and Inner Core (50 HP)
  - Inner Core exposure grants 1.5x knockback multiplier
  - Tracks total damage for knockback scaling
  
- **KindleSystem**: Special meter management
  - Fills on successful hits and taking damage
  - Decays after 3 seconds of inactivity
  - Required for special attacks
  
- **KnockbackSystem**: Percentage-based knockback calculation
  - Formula: `(base_kb + (damage% * scaling)) * kb_multiplier / weight`
  - Applies directional knockback based on attack angle

### Character System
- **StickFighter**: Base character controller
  - Movement: walk, run, jump, double jump, fast fall
  - Input handling for keyboard and controller
  - Hitstun system for combo potential

### Game Management
- **GameManager**: Match flow and victory conditions
  - Tracks blast zone boundaries
  - Detects ring-outs ("Ignition")
  - Emits match end events

### UI/HUD
- **HUD**: Displays player stats
  - Two-tiered Core bars (color-coded)
  - Kindle gauge
  - Damage percentage

## Data Flow

1. **Input → Character Movement**
   - Input actions (keyboard/controller) → StickFighter movement logic
   - Physics engine handles collision and movement

2. **Combat Flow**
   - Attacker triggers attack → Hitbox activated
   - Hitbox collision → take_hit() called on defender
   - Damage applied to CoreHealth
   - Kindle granted to both players
   - Knockback calculated and applied

3. **Health Update Flow**
   - CoreHealth.take_damage() → Updates outer/inner core
   - Emits health_changed signal → HUD updates bars
   - Checks for Ignition → GameManager handles victory

4. **Victory Detection**
   - GameManager checks blast zones each frame
   - Player position outside bounds → Ignition triggered
   - match_ended signal emitted

## Design Decisions

### Godot 4.2+ as Engine
- **Rationale**: Modern 2D engine with excellent 2D physics, signal system for event handling, and GDScript for rapid prototyping
- **Trade-off**: Requires Godot editor for development but provides robust tooling

### Two-Tiered Health System
- **Rationale**: Creates strategic depth through Inner Core multiplier, provides comeback mechanics, and visual clarity
- **Implementation**: Single health component with two separate values

### Kindle as Resource System
- **Rationale**: Prevents special spam, rewards aggressive play, creates resource management decisions
- **Implementation**: Decay mechanic encourages active play

### Percentage-Based Knockback
- **Rationale**: Familiar to platform fighter players, creates exciting late-game moments, scales naturally with damage
- **Implementation**: Total damage tracked separately from health

### Node-Based Architecture
- **Rationale**: Follows Godot best practices, allows easy composition and testing
- **Implementation**: Systems as child nodes that can be added to any character

---
*Update this document as the architecture evolves.*
