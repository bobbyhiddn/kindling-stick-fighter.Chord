# Phase 2: Core Implementation

## Objective

Implement the main functionality of the Kindling MVP - core combat mechanics.

## Tasks

- [x] Implement core features
  - [x] CoreHealth system (two-tiered HP)
  - [x] KindleSystem (special meter)
  - [x] KnockbackSystem (percentage-based)
  - [x] HitboxManager (attack detection)
- [x] Implement character controller
  - [x] Movement (walk, run, jump, double jump, fast fall)
  - [x] Attack system with frame data
  - [x] Hitstun mechanics
- [x] Implement stage & game flow
  - [x] The Hearth stage
  - [x] GameManager with blast zones
  - [x] Ring-out detection
- [x] Implement UI/HUD
  - [x] Health bars (two-tiered, color-coded)
  - [x] Kindle gauge
  - [x] Damage percentage display
- [x] Create game resources
  - [x] Attack data resources
  - [x] Character scenes
  - [x] Stage scenes
- [x] Add comprehensive tests (manual testing guide)
- [x] Add documentation

## Acceptance Criteria

- [x] Core functionality works as specified in SIGNAL.md
- [x] Two-player local gameplay functional
- [x] Keyboard and controller support working
- [x] All core systems integrated
- [x] Documentation comprehensive

## Completed

✅ **Status**: COMPLETE (MVP)

### Deliverables
1. **Core Systems**
   - CoreHealth (outer/inner core, 1.5x multiplier)
   - KindleSystem (gain, decay, spend)
   - KnockbackSystem (damage scaling)
   - HitboxManager (collision detection)

2. **Character**
   - StickFighter controller
   - Movement mechanics
   - Attack system
   - Hitstun

3. **Stage & Management**
   - The Hearth stage
   - GameManager (match flow)
   - Blast zone detection
   - Victory conditions

4. **UI/HUD**
   - Two-tiered health display
   - Kindle gauge
   - Damage percentage
   - Player labels

5. **Resources**
   - Attack data (jab, tilts, smash, aerials)
   - Character scenes
   - Stage scenes
   - UI themes

6. **Documentation**
   - Architecture documentation
   - Quick start guide
   - Controls guide
   - Testing checklist

## Next Steps (Future Enhancements)

- [ ] Add special moves (kindle-based)
- [ ] Implement attack animations
- [ ] Add visual effects (particles)
- [ ] Add sound effects
- [ ] Create menu system
- [ ] Add more characters/stages

## Notes

Phase 2 delivers a fully functional MVP with all core combat mechanics. The game is playable and demonstrates the core "Kindling" concept with two-tiered health, kindle system, and percentage-based knockback.
