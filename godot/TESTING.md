# Kindling - Testing Checklist

## Manual Testing Guide

This document outlines how to test the MVP implementation of Kindling.

## Prerequisites

- Godot 4.2+ installed
- Project loaded and running (F5)
- Optionally: a game controller for Player 2 testing

---

## Core Systems Testing

### ✅ Core Health System

**Test 1: Health Bar Display**
- [ ] Both players show full health bars at start
- [ ] Outer Core bar is orange/yellow colored
- [ ] Inner Core bar is red/ember colored
- [ ] Both bars are visible and properly aligned

**Test 2: Damage Application**
- [ ] Hitting opponent reduces their Outer Core first
- [ ] Damage % display updates when hit lands
- [ ] After Outer Core depletes, Inner Core begins to decrease
- [ ] Health bars update smoothly

**Test 3: Inner Core Multiplier**
- [ ] When Inner Core is exposed, knockback is noticeably stronger
- [ ] Compare knockback before and after Outer Core depletion
- [ ] Inner Core exposure is visually clear (only red bar showing)

**Test 4: Ignition (Health Depletion)**
- [ ] When both Core layers reach 0, Ignition occurs
- [ ] Winner is announced
- [ ] Match ends properly

---

### ✅ Kindle System

**Test 1: Kindle Gauge Display**
- [ ] Kindle gauge visible for both players
- [ ] Starts at 0%
- [ ] Maximum is 100%

**Test 2: Kindle Gain**
- [ ] Gauge fills when landing attacks
- [ ] Gauge fills slightly when taking damage
- [ ] Gauge updates smoothly in real-time

**Test 3: Kindle Decay**
- [ ] After 3 seconds of inactivity, Kindle begins to decay
- [ ] Decay is gradual (2 points per second)
- [ ] Landing a hit resets the decay timer

---

### ✅ Knockback System

**Test 1: Basic Knockback**
- [ ] Attacks launch opponent in the correct direction
- [ ] Knockback angle varies by attack type
- [ ] Knockback force increases with damage %

**Test 2: Damage Scaling**
- [ ] At 0%, knockback is minimal
- [ ] At 50%, knockback is moderate
- [ ] At 100%+, knockback is significant
- [ ] Formula works correctly: base + (damage * scaling)

**Test 3: Inner Core Multiplier**
- [ ] With Inner Core exposed, knockback is ~1.5x stronger
- [ ] Compare same attack before and after exposure
- [ ] Multiplier applies to all attacks

---

## Character & Movement Testing

### ✅ Basic Movement

**Test 1: Walking**
- [ ] P1 moves left with A
- [ ] P1 moves right with D
- [ ] P2 moves left with Left Arrow
- [ ] P2 moves right with Right Arrow
- [ ] Movement speed feels appropriate

**Test 2: Running**
- [ ] Holding movement key increases speed
- [ ] Run speed is faster than walk speed
- [ ] Character accelerates smoothly

**Test 3: Jumping**
- [ ] Space (P1) / Numpad 0 (P2) makes character jump
- [ ] Jump height is consistent
- [ ] Jump velocity is appropriate

**Test 4: Double Jump**
- [ ] Second jump press while airborne triggers double jump
- [ ] Double jump only available once per airtime
- [ ] Landing on ground resets double jump
- [ ] Double jump height is slightly less than first jump

**Test 5: Fast Fall**
- [ ] Holding Down while falling increases fall speed
- [ ] Fast fall is noticeably faster than normal fall
- [ ] Fast fall only works while falling (not rising)

**Test 6: Facing Direction**
- [ ] Character sprite flips when moving opposite direction
- [ ] Facing direction affects attack hitboxes

---

## Attack System Testing

### ✅ Basic Attacks

**Test 1: Attack Execution**
- [ ] J (P1) / Numpad 1 (P2) triggers attack
- [ ] Attack has visible startup (brief delay)
- [ ] Attack animation completes
- [ ] Recovery period before next action

**Test 2: Hitbox Detection**
- [ ] Attacks hit opponent within range
- [ ] Attacks miss when out of range
- [ ] Hitbox roughly matches attack visual
- [ ] No friendly fire

**Test 3: Attack Properties**
- [ ] Different attacks deal different damage
- [ ] Knockback angle varies by attack
- [ ] Kindle gain varies by attack
- [ ] Frame data feels appropriate

**Test 4: Hitstun**
- [ ] Hit opponent freezes briefly
- [ ] Hitstun duration scales with damage
- [ ] Cannot input during hitstun
- [ ] Hitstun enables combos

---

## Stage & Blast Zones Testing

### ✅ The Hearth Stage

**Test 1: Stage Layout**
- [ ] Flat platform is visible
- [ ] Platform is appropriate width (800 units)
- [ ] Stage has visible boundaries
- [ ] Background is visible

**Test 2: Blast Zones**
- [ ] Left blast zone at approximately -600
- [ ] Right blast zone at approximately 600
- [ ] Top blast zone (vertical launch)
- [ ] Bottom blast zone (falling off)

**Test 3: Ring-Out Detection**
- [ ] Crossing left boundary triggers Ignition
- [ ] Crossing right boundary triggers Ignition
- [ ] Crossing top boundary triggers Ignition
- [ ] Crossing bottom boundary triggers Ignition
- [ ] Winner is announced correctly

---

## UI/HUD Testing

### ✅ Player Stats Display

**Test 1: Health Bars**
- [ ] P1 health bars on left side
- [ ] P2 health bars on right side
- [ ] Outer Core bar updates correctly
- [ ] Inner Core bar updates correctly
- [ ] Color coding is clear

**Test 2: Damage Percentage**
- [ ] Damage % starts at 0%
- [ ] Updates when hit
- [ ] Display is readable
- [ ] Positioned near health bars

**Test 3: Kindle Gauge**
- [ ] Kindle bar visible for both players
- [ ] Updates in real-time
- [ ] Color/style is distinct from health

**Test 4: Player Labels**
- [ ] "PLAYER 1" label visible
- [ ] "PLAYER 2" label visible
- [ ] Labels are readable

---

## Input Testing

### ✅ Keyboard Controls

**Test Player 1 (WASD)**
- [ ] W - Up/Jump works
- [ ] A - Left works
- [ ] S - Down/Fast fall works
- [ ] D - Right works
- [ ] Space - Jump works
- [ ] J - Attack works
- [ ] K - Special input works (if implemented)

**Test Player 2 (Arrows)**
- [ ] Up Arrow - Up/Jump works
- [ ] Left Arrow - Left works
- [ ] Down Arrow - Down/Fast fall works
- [ ] Right Arrow - Right works
- [ ] Numpad 0 - Jump works
- [ ] Numpad 1 - Attack works
- [ ] Numpad 2 - Special input works (if implemented)

### ✅ Controller Support (Player 2)

**Test Controller Input**
- [ ] Left stick - Movement works
- [ ] D-Pad - Movement works
- [ ] A button (South) - Jump works
- [ ] X button (West) - Attack works
- [ ] Y button (North) - Special works (if implemented)

---

## Two-Player Testing

### ✅ Local Multiplayer

**Test 1: Simultaneous Input**
- [ ] Both players can move at same time
- [ ] No input conflicts
- [ ] Controls remain responsive

**Test 2: Combat Interaction**
- [ ] P1 can hit P2
- [ ] P2 can hit P1
- [ ] Damage applies correctly to each
- [ ] Knockback works in both directions

**Test 3: Match Flow**
- [ ] Match starts with both players at spawn points
- [ ] Combat flows naturally
- [ ] Victory condition triggers correctly
- [ ] Winner is clearly indicated

---

## Performance Testing

### ✅ Frame Rate

- [ ] Game runs smoothly (60 FPS target)
- [ ] No noticeable lag during combat
- [ ] HUD updates don't cause slowdown

### ✅ Collision Detection

- [ ] Characters collide with stage properly
- [ ] No falling through floor
- [ ] Hitboxes detect accurately
- [ ] No phantom hits

---

## Edge Cases & Bugs

### Common Issues to Check

- [ ] Simultaneous attacks don't crash
- [ ] Double KO handled gracefully
- [ ] Can't attack during hitstun
- [ ] Can't attack during another attack
- [ ] Blast zone detection is immediate
- [ ] Health never goes negative
- [ ] Kindle doesn't exceed 100%
- [ ] Damage % updates correctly

---

## Test Results Summary

### Passing Criteria
- All core mechanics functional
- No game-breaking bugs
- Controls responsive
- Victory conditions work

### Known Issues
*Document any issues found during testing here:*

1. 
2. 
3. 

---

## Next Steps After Testing

Based on test results:
1. Fix critical bugs
2. Tune gameplay parameters
3. Add missing features
4. Polish existing systems

---

*Last Updated: 2026-01-25*
