---
title: Final Testing & Results
description: Test plan, pass/fail criteria, and measured results for the completed prototype.
---

This page is the acceptance-test record for the completed prototype. The test procedures and pass criteria below come directly from the verification column of the [engineering requirements](/build/engineering-requirements/) — the "Measured Result" and "Pass?" columns are filled in as each test is actually run.

All acceptance testing is performed with an unheated, laboratory-safe medium at room temperature, using the approved prototype payload (1 lb). The prototype does not validate operation at the intended industrial temperature or with a production coating medium.

## Viability video

Checkpoint 2 video of the integrated prototype and its requirement tests (3 min 57 s, posted October 27, 2026). It shows the electronics enclosure, position measurements against a ruler, the vertical axis, the Modbus monitor on a laptop, and the "Screw not slipping test" of the magnet holder.

<video controls preload="metadata" playsinline class="progress-video" src="/progress/viability-video.mp4"></video>

The results table below records each requirement's measured value and status. A requirement that has not been measured is marked Not yet tested, with what remains, the cause, and the planned date from the Weekly Task Plan.

## Requirements and results

| ID | Test Procedure | Pass Criteria | Measured Result | Pass? |
|---|---|---|---|---|
| R-01 | Command a cycle with the trigger asserted by a push button; then release it, disconnect it, and command a cycle each time. | A cycle starts with the trigger asserted; no motion starts with it released or disconnected. | Not yet tested. Remaining: add the part-ready trigger input (a pair of pins, closed means part ready), then run a cycle with the trigger closed, open, and disconnected. Cause: the trigger input has not been added to the firmware yet. Planned: Week 13 (11/16–11/20). | Not yet tested |
| R-02 | Command the system to the programmed pickup position and measure end-effector position relative to target. | Measured error within ±1 cm along both axes. | Measured with a ruler. X: drift under 0.5 cm. Y: harder to measure because the platform moves; judged within 1 cm, not measured precisely. Both axes have since been calibrated, and the X axis was checked again and found correct, but that check was not recorded. To be measured again and recorded in Week 13. | Met |
| R-03 | Execute one complete pick-dip-place cycle at the approved payload. | Workpiece does not visibly slip or detach at any point. | Shown in the viability video ("Screw not slipping test"): the piece does not slip or fall. Also tested informally with a weight of 2.5 lb or more and a minimal contact area, which was held through a full cycle. | Met |
| R-04 | Execute one dip sequence and measure actual immersion depth against the programmed value. | Measured depth within ±1 cm of programmed depth. | Not yet tested. Remaining: measure the immersion depth. Both axes are calibrated (X 40 steps/mm, Y 800 steps/mm), so only the measurement is missing. Planned: Week 13 (11/16–11/20). | Not yet tested |
| R-05 | Execute one dip sequence and measure the dwell period with a stopwatch. | Measured dwell within ±1 s of programmed value. | Not yet documented. The dwell looked correct in informal cycles, but it was not timed or recorded. Remaining: time the dwell with a stopwatch or from a recording. Planned: Week 13 (11/16–11/20). | Not yet tested |
| R-06 | Command one operating cycle and confirm the trigger, acquisition, transfer, lowering, dwell, raising, transfer, release, and homing. | Every stage completes in order without operator intervention. | Every stage completes in order without operator intervention, as seen in the recordings of the prototype running. The cycle is started with the Start button, because the part-ready trigger is not added yet; that start is tested under R-01. | Met |
| R-07 | Actuate the emergency stop while an axis is moving; measure power at both stepper drivers. | Driver power removed and all axis motion stops. | Not yet tested formally. The emergency stop is installed, and an informal test in Week 10 confirmed that it cut the driver power. The motor-supply relay has since failed with its contact closed, so driver power is not cut at the moment. The emergency stop still stops the machine, because the second relay signals the controller, which stops the step pulses. The relay will be replaced in Week 13, probably by switching the AC side of the power supply, and the test will be run and recorded then. | Not yet tested |
| R-08 | Actuate the e-stop, reset the button, and attempt to command motion without the restart action. | No motion occurs until the deliberate restart action is performed. | Not yet tested formally. An informal test confirmed that the system restarts only after a deliberate press of Start: faults stay latched until a Start press clears them, and a second press restarts the cycle. To be documented after the relay is replaced (Week 13). | Not yet tested |
| R-09 | Monitor the communications interface through one cycle and introduce a detectable fault. | Each state transition and the active fault are transmitted with correct labels. | State reporting over Modbus is shown working in the viability video. Fault reporting was added in Week 11, and a screen recording of the dashboard shows the emergency-stop fault latched and marked as the first fault. The other faults have not been shown yet. Remaining: show a fault appearing while the machine runs. | Partially met |
| R-10 | Command ten consecutive full cycles, recording cycle time, commanded/measured immersion depth, and dwell time for each. | All ten complete; no drops, no missed placements; depth and dwell within tolerance. | Not yet tested. Remaining: ten consecutive cycles with the depth recorded for each. Both axes are calibrated, so only the cycles and the measurements are missing. Planned: Week 13 (11/16–11/20). | Not yet tested |
| R-11 | Attach a 1 lb workpiece and command one complete cycle. | Lifts, transports, lowers, retains, and releases without stalling, losing position, slipping, or dropping. | Fulfilled in an informal test with a weight of 2.5 lb or more, above the required 1 lb, which was held through a full cycle. | Met |

## Observations

Most of the system worked on the first attempt. The limit switches were very noisy when first connected and caused false faults; a 3 ms software debounce and braided wires fixed it. The motor-supply relay failed with its contact closed, and it will be replaced. The emergency stop still stops the machine through the second relay, which signals the controller. Several tests were run informally while the whole system was being tested and were not recorded, so they are marked as not yet tested until they are repeated with a recording.
