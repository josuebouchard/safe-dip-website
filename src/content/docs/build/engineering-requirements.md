---
title: Project Requirements, Success/Testing Criteria, and Limitations
description: Numbered requirements with a success criterion and a test method each, and the operating limitations of the Safe Dip prototype.
---

Each requirement below describes a specific, observable behavior with a defined pass condition. The system is treated as a black box: the focus is on interactions with the system's boundaries and the required level of performance, not on how it's implemented internally.

| ID | Requirement | Success criterion | Test method |
|---|---|---|---|
| R-01 | The system shall not initiate motion unless a workpiece is detected at the input station. | Pick sequence initiates with a workpiece present; no motion initiates with it absent. | Place a workpiece at the input station and command an operating cycle. Remove the workpiece and command another cycle. |
| R-02 | The system shall position the end effector at the programmed pickup position within ±1 cm along both axes before acquiring the workpiece. | Measured error within ±1 cm along both axes. | Command the system to the programmed pickup position and measure the position of the end effector relative to the target. |
| R-03 | The system shall retain the workpiece throughout the complete pick-dip-place cycle without slipping or dropping it. | Workpiece does not visibly slip or detach at any point. | Execute one complete pick-dip-place cycle using the approved prototype payload. |
| R-04 | The system shall lower the workpiece to the programmed immersion depth within ±1 cm. | Measured depth within ±1 cm of programmed depth. | Execute one dip sequence and measure the actual immersion depth relative to the programmed value. |
| R-05 | The system shall hold the workpiece at the programmed immersion depth for the programmed dwell time within ±1 s. | Measured dwell within ±1 s of programmed value. | Execute one dip sequence and measure the dwell period with a stopwatch or equivalent timing instrument. |
| R-06 | The system shall complete one full unattended pick-dip-place cycle, beginning with workpiece detection at the input station and ending with workpiece release at the output station and return to the home position. | Every stage completes in order without operator intervention. | Place a workpiece at the input station and command one operating cycle. Confirm that the system detects and acquires the workpiece, transfers it to the dipping position, lowers it to the programmed immersion depth, holds it for the programmed dwell time, raises it, transfers it to the output station, releases it, and returns to the home position. |
| R-07 | The system shall remove power from both stepper-motor drivers when the emergency stop is actuated. | Driver power removed and all axis motion stops. | Actuate the emergency stop while an axis is moving and measure the power supplied to both stepper-motor drivers. |
| R-08 | The system shall remain inhibited following an emergency-stop event until the emergency-stop button has been reset and the operator performs a deliberate restart action. | No motion occurs until the deliberate restart action is performed. | Actuate the emergency stop during operation, reset the emergency-stop button, and attempt to command motion without performing the restart action. Perform the deliberate restart action and confirm that normal operation can be re-established. |
| R-09 | The system shall transmit its current operating state and any active faults through the selected communications interface during operation. | Each state transition and the active fault are transmitted with correct labels. | Monitor the communications interface during one complete operating cycle and introduce at least one detectable fault condition. |
| R-10 | The system shall complete ten consecutive unattended full pick-dip-place cycles using the approved prototype payload without dropping a workpiece, missing the intended placement position, or requiring operator intervention between cycles. | All ten complete; no drops, no missed placements; depth and dwell within tolerance. | Command the system to perform ten consecutive full pick-dip-place cycles using the approved prototype payload. Record the cycle time, commanded immersion depth, measured immersion depth, and measured dwell time for each cycle. |
| R-11 | The system shall complete the full pick-dip-place cycle while carrying a workpiece with a mass of 1 lb. | Lifts, transports, lowers, retains, and releases without stalling, losing position, slipping, or dropping. | Attach a 1 lb workpiece and command one complete pick-dip-place cycle. |

## Operating Limitations

These constraints scope the design and inform component selection; they are not subject to pass/fail testing.

- Safe Dip operates along two axes only — a horizontal axis for transfer between the input station, dipping bath, and output station, and a vertical axis for picking, dipping, and placing the workpiece. The system does not support rotation or movement perpendicular to the horizontal travel path.
- The system is designed to handle cylindrical workpieces within the specified size and payload limits.
- Workpieces must be presented at a known, fixed input position. The system does not perform lateral alignment, orientation correction, or vision-based localization.
- Each workpiece must provide a clean, flat, ferromagnetic attachment surface that remains outside the required coating area, since the electromagnet stays in contact with this surface throughout the cycle.

For the laboratory prototype specifically:

- Validated for workpieces with a maximum mass of 1 lb.
- The prototype is not operated with a heated dipping bath; all acceptance testing uses an unheated, laboratory-safe medium at room temperature.
- The prototype does not validate operation near molten wax, heated resin, process fumes, splashing hot material, or other industrial hot-dip conditions.
