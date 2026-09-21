---
title: Engineering Standards & Compliance Codes
description: Industry standards shaping Safe Dip's design, plus the prototype's hazard analysis, copied from the senior design proposal.
---

The codes and standards below were identified as relevant references for the design and development of Safe Dip. Their inclusion does **not** represent a claim of certification or complete compliance — formal compliance would require evaluating the finished system against the complete requirements of each applicable document.

## Applicable Codes & Standards

| Code or Standard | Organization | Explanation | Relevance to Safe Dip |
|---|---|---|---|
| IEEE Code of Ethics | Institute of Electrical and Electronics Engineers | Defines ethical duties related to safety, honesty, competence, and public welfare. | Supports safe design, truthful reporting, and clear disclosure of prototype limitations. |
| NSPE Code of Ethics for Engineers | National Society of Professional Engineers | Requires engineers to prioritize public safety and communicate technical information honestly. | Applies to safety decisions, testing, risk disclosure, and performance claims. |
| ISO 13850:2015 | International Organization for Standardization | Defines requirements and design principles for machinery emergency-stop functions. | Guides the latching e-stop, immediate motion cutoff, manual reset, and restart inhibition. |
| ISO 14118:2017 | International Organization for Standardization | Addresses prevention of unexpected machine start-up. | Requires a deliberate restart action after the e-stop is reset. |
| NFPA 79 | National Fire Protection Association | Covers electrical equipment, wiring, protection, and controls for industrial machinery. | Guides internal wiring, branch protection, grounding, control circuits, and e-stop wiring. |
| NFPA 70 (National Electrical Code) | National Fire Protection Association | Defines requirements for safe electrical installations and supply connections. | Guides power connections, wiring, fuses, grounding, and electrical fault protection. |
| IEC 60204-1 | International Electrotechnical Commission | Safety of machinery — electrical equipment of machines. Defines emergency-stop categories. | Drives the Category 0 stop architecture described below. |

## IEC 60204-1 — Safety of Machinery, Electrical Equipment of Machines

IEC 60204-1 specifies three categories of emergency stop:

- **Category 0** — uncontrolled stop by immediate removal of actuator power.
- **Category 1** — controlled stop, with power retained long enough to stop, then removed.
- **Category 2** — controlled stop with actuator power remaining available.

Safe Dip implements a **Category 0** stop for the movement subsystem: a normally-closed, mechanically latching mushroom button wired directly into the stepper-driver power path. Because the stop path is hardwired and normally closed, pressing the button or breaking a wire opens the circuit without any action from the microcontroller — satisfying IEC 60204-1's requirement that a Category 0 stop operate through hardwired electromechanical components rather than depending on electronic logic. The button remains latched until manually reset.

The electromagnet end effector is deliberately **not** included in the Category 0 cutoff: it's treated as a load-holding device rather than a hazardous actuator that must be immediately de-energized, since removing its power during an emergency stop could drop the suspended part into the coating bath — itself a hazard IEC 60204-1 requires the e-stop function to avoid creating. The electromagnet stays energized during a stop, and the part is only released in a controlled manner after motion has ceased.

See [Proposed & Alternate Ideas](/proposal/ideas/) for the reasoning behind choosing Category 0 over Category 1 or 2.

## Primary Prototype Hazards

| Hazard | Prototype Control | Residual Limitation |
|---|---|---|
| Unexpected axis motion | Normally-closed, twist-reset mushroom emergency stop removes power from both motor drivers. Firmware prevents automatic restart after a stop event. | The emergency stop does not replace safe setup procedures or physical separation from the moving gantry. |
| Pinch and crush points | Motion is limited to controlled laboratory tests; personnel must stay clear of the rails, leadscrew, belt transmission, and carriage while the system is enabled. | The current prototype does not claim the protection of a fully guarded industrial cell. |
| Suspended workpiece | The magnet stays powered during a motion emergency stop. Retention is tested before complete-cycle operation, and no one may stand beneath the workpiece. | A conventional electromagnet does not retain the workpiece after a total loss of magnet power — a prototype limitation that must not be described as fail-safe load retention. |
| Electrical fault or short circuit | Fuses are installed in the prototype power branches; exposed connections are insulated and secured before operation. | Fuse ratings and conductor sizes must be finalized from the actual branch currents and selected hardware. |
| Loss of position reference | Normally-closed limit switches provide homing/boundary references; the time-of-flight sensor verifies workpiece presence before a cycle begins. | Sensor detection does not make entry into the machine workspace safe while motion is enabled. |
| Thermal or coating exposure | No heated coating material is used during prototype acceptance testing. | The prototype does not validate operation at the intended industrial temperature or with a production coating medium. |

The laboratory prototype is evaluated with a ~1 lb workpiece and no process heat, but was designed in preparation for the full-scale 10 kg, elevated-temperature product concept — which would present meaningfully greater mechanical, electrical, and suspended-load hazards that the current prototype does not validate.
