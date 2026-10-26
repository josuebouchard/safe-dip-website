---
title: Distribution of tasks
description: The current owner of each part of the Safe Dip project, and how the responsibilities changed since the proposal.
---

The task assignments identify a primary owner for each activity, but they don't prevent either team member from assisting with work outside that assignment. Mechanical and software tasks are deliberately paired during integration so that installation, programming, and validation decisions are made jointly. The current distribution is given first, after the changes described below, followed by the preliminary distribution from the proposal.

## Current distribution

| Team Member | Primary Responsibilities |
|---|---|
| Josué Bouchard | Embedded firmware; selection and interfacing of the workpiece-detection sensor and interfacing of the limit switches; horizontal- and vertical-axis motion control; supervisory state machine; Modbus TCP integration; electrical design, including the power distribution and wiring; system debugging; software-oriented verification; project documentation; and preparation of most of the report. |
| Adriano Duque Mena | Mechanical design in CAD, including the vertical assembly; mechanical frame assembly; installation of rails, transmissions, motors, and sensors; fabrication of custom parts; procurement of the mechanical components; mechanical troubleshooting; preparation of rated-load testing; and preparation of the mechanical parts of the report. |
| Both | Procurement of the remaining components; electrical and mechanical integration; emergency-stop validation; complete-system testing; final refinement; and presentation. |

## Changes since the proposal

- The external conveyor interfaces were removed from the project scope, so the conveyor activities of the proposed timeline no longer apply.
- An HC-SR04 ultrasonic sensor was chosen for workpiece detection because of its affordability and availability, and it is assumed to be sufficient for the prototype.
- Electrical design and project documentation became part of Josué's responsibilities.
- Mechanical design in CAD and the procurement of the mechanical components became part of Adriano's responsibilities.
- Report preparation, previously shared, is now split: Josué writes most of the report, and Adriano contributes the mechanical parts.

Two factors drove these changes. The first is the dependencies between tasks: the electrical design depends on the firmware, which defines the controller's pin assignments and the driver interfaces, and procurement depends on the mechanical design, which determines which parts are needed. The second is availability and timing: when a task became ready, it was taken by the team member who could start it first, rather than waiting for the originally assigned owner.

## Preliminary distribution (proposal)

| Team Member | Primary Responsibilities |
|---|---|
| Josué Bouchard | Embedded firmware; ultrasonic-sensor and limit-switch interfacing; horizontal- and vertical-axis motion control; supervisory state machine; Modbus TCP integration; system debugging; and software-oriented verification. |
| Adriano Duque Mena | Mechanical frame assembly; installation of rails, transmissions, motors, sensors, and external conveyor interfaces; mechanical troubleshooting; fabrication support; and preparation of rated-load testing. |
| Both | Component procurement; electrical and mechanical integration; emergency-stop validation; complete-system testing; final refinement; report preparation; and presentation. |
