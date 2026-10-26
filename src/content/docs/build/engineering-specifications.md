---
title: Engineering Specifications
description: Specifications for each module and its components, with the link to the CAD drawings and dimensions.
---

Where [Engineering Requirements](/build/engineering-requirements/) state *what* the system must do, specifications pin down the quantified target value for each subsystem module.

### Power Distribution

| Specific Component | Engineering Specifications | Justification & Verification |
|---|---|---|
| AC-DC power supply (motors) | Input: 110 VAC, 60 Hz. Output: 24 VDC. Must supply sufficient current for two stepper motors at peak load. | Verified by measuring output voltage under full load with a multimeter. |
| AC-DC power supply (12 V) | Input: 110 VAC, 60 Hz. Output: 12 VDC. Ripple and noise within acceptable limits for logic, sensors, and effector. | Verified by measuring output voltage and ripple with an oscilloscope under full load. |
| DC-DC buck converter (12 V → 5 V) | Input: 12 VDC. Output: 5 VDC. Ripple and noise within acceptable limits for logic and sensors. | Verified by measuring output voltage and ripple with an oscilloscope under full load. |

### E-Stop

| Specific Component | Engineering Specifications | Justification & Verification |
|---|---|---|
| Emergency stop button | Must offer a normally closed channel for cutting the power to the motors. Must be able to handle peak power coming from the AC-DC power supply (motors). Requires manual reset before power is restored. | Verified by actuating the E-stop during operation and confirming output power is cut. |

### Processing

| Specific Component | Engineering Specifications | Justification & Verification |
|---|---|---|
| Microcontroller | Operates at 3.3 VDC. Sufficient GPIO for stepper control, sensor inputs, and effector output. Supports USB UART for baseline serial communications. Capable of driving a Pulse Train Output (PTO) at the frequency set by the stepper and stepper controller. | Verified using an oscilloscope to check GPIO voltage and PTO frequency. |

### Sensing

| Specific Component | Engineering Specifications | Justification & Verification |
|---|---|---|
| Ultrasonic sensor (HC-SR04) | Operating voltage: 5 VDC. Detection range sufficient to cover the input station. Blind zone under 3 cm. Trigger and echo interface compatible with the microcontroller, with the 5 V echo output on a 5 V-tolerant input. | Chosen for its affordability and availability, and assumed sufficient for the prototype. Verified by placing and removing a part at the input station and confirming correct detection in both cases. |
| Limit switches | Normally-closed configuration. One per axis end, used for homing. Rated for the operating environment. | Verified by commanding each axis to its respective home and confirming motion stops upon switch actuation. |

### Movement

| Specific Component | Engineering Specifications | Justification & Verification |
|---|---|---|
| Stepper motors (×2) | NEMA 23 frame. Holding torque sufficient to lift rated payload on the vertical axis and drive the belt under load on the horizontal axis. Positional accuracy: ±1 cm. | Verified by commanding each axis to a known target and measuring offset with a ruler. |
| Stepper motor drivers (×2) | Compatible with a 24 VDC supply. Microstepping support. Current output set to motor rating. | Verified by confirming smooth motion on both axes across the full travel range. |

### End Effector

| Specific Component | Engineering Specifications | Justification & Verification |
|---|---|---|
| Electromagnet | Holding force sufficient to retain rated payload throughout the dip cycle. Controlled by a single digital output from the microcontroller. | Verified by attaching a part at rated payload and confirming no drop occurs throughout one full pick-dip-place cycle. |
| Effector driver | Active-low control input that the microcontroller can drive from a single open-drain output. Isolates the microcontroller from the 12 V electromagnet circuit. Normally-closed contact that keeps the electromagnet energized whenever the relay coil is off. Contact voltage rating greater than the 12 V electromagnet supply. Contact current rating greater than the maximum electromagnet current. | Command the electromagnet on and off from the firmware while monitoring the control input and the electromagnet voltage. Passes if the driver switches the full electromagnet current reliably, the electromagnet stays engaged when the control input is released or the module loses its 5 V supply, it stays within an acceptable temperature range, and no damaging voltage transient is observed when de-energized. |

### Communications

| Specific Component | Engineering Specifications | Justification & Verification |
|---|---|---|
| Ethernet module | Operating voltage compatible with the processing module. SPI interface compatible with the microcontroller. Reports system state, axis positions, and fault events. Supports Ethernet and TCP socket communication. | Verify communication between the STM32 and the Ethernet module over SPI. Establish a TCP connection from an external computer and confirm data can be transmitted and received. |

## CAD Drawings and Dimensions

The CAD model of the current design, with the principal dimensions of the prototype, is on the [CAD Drawings & Renderings](/build/cad/) page.
