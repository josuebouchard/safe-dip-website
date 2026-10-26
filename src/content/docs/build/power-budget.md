---
title: Power budget of the project
description: Voltage, current, and power of each load, and the load on each power rail compared with its supply rating.
---

The Safe Dip prototype uses two independent AC-DC power adapters. The 24 V supply provides a maximum of 14.6 A (~350.4 W) and powers the movement subsystem. The 12 V adapter provides a maximum of 5 A (60 W) and powers the electromagnet and low-voltage circuitry. Together, the two adapters provide a total rated output capacity of approximately 410.4 W.

## Power Budget by Component

| Module | Component | Voltage (V) | Current (A) | Unit Power (W) | Qty | Total Power (W) |
|---|---|---|---|---|---|---|
| Movement | Stepper motor (max usage per phase) | 24 | 2.8 | 67.2 | 2 | 134.4 |
| Movement | Stepper motor driver | 24 | 0.5 | 12 | 2 | 24 |
| End Effector | Electromagnet | 12 | 1.5 | 18 | 1 | 18 |
| End Effector | Electromagnet driver | 5 | ≈0.07–0.10 | ≈0.5 | 1 | ≈0.5 |
| Sensing | Ultrasonic sensor (HC-SR04) | 5 | 0.015 | ≈0.075 | 1 | ≈0.075 |
| Communications | Ethernet module | 3.3 | 0.132 | ≈0.436 | 1 | ≈0.436 |
| Processing | STM32 (at max rate) | 3.3/5 | ≈0.1 | ≈0.33 | 1 | ≈0.33 |
| | | | | **Total operational power** | | **177.7 W** |

## Available Supply Capacity

| Power Rail | Power Adapter | Voltage (V) | Maximum Current (A) | Maximum Power (W) |
|---|---|---|---|---|
| 24 V | Mean Well LRS-350-24 | 24 | 14.6 | 350.4 |
| 12 V | 12 V AC-DC power adapter | 12 | 5 | 60 |
| | | | **Total available power** | **410.4 W** |

Total operational power draw (177.7 W) stays within the 410.4 W available from the two supplies, leaving margin for inrush current and future additions.

## Load per Power Rail

| Power Rail | Loads | Load (W) | Adapter Rating (W) | Share of Rating |
|---|---|---|---|---|
| 24 V | Two stepper motors and two stepper motor drivers | 158.4 | 350.4 | 45% |
| 12 V | Electromagnet, and, through the 12 V to 5 V buck converter, the electromagnet driver, ultrasonic sensor, Ethernet module, and STM32 (conversion losses neglected) | 19.3 | 60 | 32% |
| | **Total** | **177.7** | **410.4** | **43%** |

