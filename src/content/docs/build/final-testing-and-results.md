---
title: Final Testing & Results
description: Test plan, pass/fail criteria, and measured results for the completed prototype.
---

This page is the acceptance-test record for the completed prototype. The test procedures and pass criteria below come directly from the verification column of the [engineering requirements](/build/engineering-requirements/) — the "Measured Result" and "Pass?" columns are filled in as each test is actually run.

All acceptance testing is performed with an unheated, laboratory-safe medium at room temperature, using the approved prototype payload (1 lb). The prototype does not validate operation at the intended industrial temperature or with a production coating medium.

| ID | Test Procedure | Pass Criteria | Measured Result | Pass? |
|---|---|---|---|---|
| SR-01 | Place a workpiece at the input station and command a cycle; then remove it and command another. | Pick sequence initiates with a workpiece present; no motion initiates with it absent. | _TODO_ | _TODO_ |
| SR-02 | Command the system to the programmed pickup position and measure end-effector position relative to target. | Measured error within ±1 cm along both axes. | _TODO_ | _TODO_ |
| SR-03 | Execute one complete pick-dip-place cycle at the approved payload. | Workpiece does not visibly slip or detach at any point. | _TODO_ | _TODO_ |
| SR-04 | Execute one dip sequence and measure actual immersion depth against the programmed value. | Measured depth within ±1 cm of programmed depth. | _TODO_ | _TODO_ |
| SR-05 | Execute one dip sequence and measure the dwell period with a stopwatch. | Measured dwell within ±1 s of programmed value. | _TODO_ | _TODO_ |
| SR-06 | Command one operating cycle and confirm detection, acquisition, transfer, lowering, dwell, raising, transfer, release, and homing. | Every stage completes in order without operator intervention. | _TODO_ | _TODO_ |
| SR-07 | Actuate the emergency stop while an axis is moving; measure power at both stepper drivers. | Driver power removed and all axis motion stops. | _TODO_ | _TODO_ |
| SR-08 | Actuate the e-stop, reset the button, and attempt to command motion without the restart action. | No motion occurs until the deliberate restart action is performed. | _TODO_ | _TODO_ |
| SR-09 | Monitor the communications interface through one cycle and introduce a detectable fault. | Each state transition and the active fault are transmitted with correct labels. | _TODO_ | _TODO_ |
| SR-10 | Command ten consecutive full cycles, recording cycle time, commanded/measured immersion depth, and dwell time for each. | All ten complete; no drops, no missed placements; depth and dwell within tolerance. | _TODO_ | _TODO_ |
| SR-11 | Attach a 1 lb workpiece and command one complete cycle. | Lifts, transports, lowers, retains, and releases without stalling, losing position, slipping, or dropping. | _TODO_ | _TODO_ |

## Observations

<!--
TODO: As testing proceeds, record here:
- What worked on the first attempt vs. what needed rework.
- Any design changes made in response to a failed test (and which requirement drove them).
- Photos or video of the working prototype during each test.
- Any requirement that could not be tested, and why.
-->
