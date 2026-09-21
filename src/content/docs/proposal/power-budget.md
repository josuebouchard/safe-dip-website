---
title: Power Budget
description: Estimated current draw and available supply capacity for the proposed design, copied from the senior design proposal.
---

The Safe Dip prototype uses two independent AC-DC power adapters. The 48 V supply provides a maximum of 7.3 A (~350.4 W) and powers the movement subsystem. The 12 V adapter provides a maximum of 5 A (60 W) and powers the electromagnet and low-voltage circuitry. Together, the two adapters provide a total rated output capacity of approximately 410.4 W.

## Power Budget by Component

| Module | Component | Voltage (V) | Current (A) | Unit Power (W) | Qty | Total Power (W) |
|---|---|---|---|---|---|---|
| Movement | Stepper motor (max usage per phase) | 48 | 2.8 | 134.4 | 2 | 268.8 |
| Movement | Stepper motor driver | 24–50 (48) | 0.5 | ≈24 | 2 | ≈48 |
| End Effector | Electromagnet | 24 | 1.12 | 26.88 | 1 | 26.88 |
| End Effector | Electromagnet driver | 5 | ≈0.07–0.10 | ≈0.5 | 1 | ≈0.5 |
| End Effector | Relays when powered | 5 | 0.07–0.10 | ≈0.35–0.50 | 1 | ≈0.35–0.50 |
| Sensing | Time-of-flight sensor | 2.8–3.3 | 0.019 | ≈0.063 | 1 | ≈0.063 |
| Communications | Ethernet module | 3.3 | 0.132 | ≈0.436 | 1 | ≈0.436 |
| Processing | STM32 (at max rate) | 3.3/5 | ≈0.1 | ≈0.33 | 1 | ≈0.33 |
| Processing | Buffer ICs | 5 | ≈2 µA | ≈0.00001 (negligible) | 1 | ≈0.00001 |
| | | | | **Total operational power** | | **345.5 W** |

## Available Supply Capacity

| Power Rail | Power Adapter | Voltage (V) | Maximum Current (A) | Maximum Power (W) |
|---|---|---|---|---|
| 48 V | Mean Well LRS-350-48 | 48 | 7.3 | 350.4 |
| 12 V | 12 V AC-DC power adapter | 12 | 5 | 60 |
| | | | **Total available power** | **410.4 W** |

Total operational power draw (345.5 W) stays within the 410.4 W available from the two supplies, leaving margin for inrush current and future additions.
