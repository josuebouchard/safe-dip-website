---
title: Final Testing & Results
description: Test plan, pass/fail criteria, and measured results for the completed prototype.
---

This page is the acceptance-test record for the completed prototype. The test procedures and pass criteria below come directly from the verification column of the [engineering requirements](/build/engineering-requirements/) — the "Measured Result" and "Pass?" columns are filled in as each test is actually run.

All acceptance testing is performed with an unheated, laboratory-safe medium at room temperature, using the approved prototype payload (1 lb). The prototype does not validate operation at the intended industrial temperature or with a production coating medium.

## Viability video

Checkpoint 2 video of the integrated prototype and its requirement tests (3 min 57 s, posted October 27, 2026). It shows the electronics enclosure, position measurements against a ruler, the vertical axis, the Modbus monitor on a laptop, and the "Screw not slipping test" of the magnet holder.

<video controls preload="metadata" playsinline class="progress-video" src="/progress/viability-video.mp4"></video>

## Test videos

Videos of the ten-cycle test, which supports R-02, R-04, R-05, R-06, R-09, R-10 and R-11. Times in the table and in the write-ups are minutes and seconds of the ten-cycle test video. The videos are hosted on YouTube because of their size.

**Ten-cycle unattended test with the Modbus monitor side by side** (11 min 53 s). About ten full cycles and part of an eleventh. [Open on YouTube](https://youtu.be/B5UD4GsUm4Q).

<iframe class="progress-video" style="width: 100%; aspect-ratio: 16 / 9; border: 0;" src="https://www.youtube.com/embed/B5UD4GsUm4Q" title="Ten-cycle unattended test with the Modbus monitor side by side" loading="lazy" allowfullscreen></iframe>

**X-axis displacement consistency test.** [Open on YouTube](https://youtu.be/skyr9MUUW84).

<iframe class="progress-video" style="width: 100%; aspect-ratio: 16 / 9; border: 0;" src="https://www.youtube.com/embed/skyr9MUUW84" title="X-axis displacement consistency test" loading="lazy" allowfullscreen></iframe>

The results table below records each requirement's measured value and status. A requirement that has not been measured is marked Not yet tested, with what remains, the cause, and the planned date from the Weekly Task Plan.

## Requirements and results

| ID | Test Procedure | Pass Criteria | Measured Result | Pass? |
|---|---|---|---|---|
| R-01 | Command a cycle with the trigger asserted by a push button; then release it, disconnect it, and command a cycle each time. | A cycle starts with the trigger asserted; no motion starts with it released or disconnected. | Not yet tested. Remaining: add the part-ready trigger input (a pair of pins, closed means part ready), then run a cycle with the trigger closed, open, and disconnected. Cause: the trigger input has not been added to the firmware yet. Planned: Week 13 (11/16–11/20). | Not yet tested |
| R-02 | Command the system to the programmed pickup position and measure end-effector position relative to target. | Measured error within ±1 cm along both axes. | Measured with a ruler. X: drift under 0.5 cm. Y: harder to measure because the platform moves; judged within 1 cm, not measured precisely. A later video of the X axis shows a consistent reading of about 4 cm at home across repeated moves, and the drift of the X axis in that video was not greater than 0.25 cm. Because each cycle homes both axes on their limit switches, the errors do not add up from one cycle to the next. To be measured again and recorded in Week 13. | Met |
| R-03 | Execute one complete pick-dip-place cycle at the approved payload. | Workpiece does not visibly slip or detach at any point. | Shown in the viability video ("Screw not slipping test"): the piece does not slip or fall. Also tested informally with a weight of 2.5 lb or more and a minimal contact area, which was held through a full cycle. | Met |
| R-04 | Execute one dip sequence and measure actual immersion depth against the programmed value. | Measured depth within ±1 cm of programmed depth. | Measured with a ruler during the ten-cycle unattended test: the vertical axis read 9.3 cm at the top and 19.3 cm at the bottom, an immersion depth of 10.0 cm against a programmed depth of 100 mm. Measured on one cycle. | Met |
| R-05 | Execute one dip sequence and measure the dwell period with a stopwatch. | Measured dwell within ±1 s of programmed value. | Measured frame by frame on the video of the ten-cycle unattended test: the dwell lasted 2.10 s against a programmed 2000 ms, an error of +0.10 s. Measured on one cycle. | Met |
| R-06 | Command one operating cycle and confirm the trigger, acquisition, transfer, lowering, dwell, raising, transfer, release, and homing. | Every stage completes in order without operator intervention. | Every stage completes in order without operator intervention, as seen in the cycle at about 9:02 to 10:07 of the ten-cycle test video. The cycle is started with the Start button, because the part-ready trigger is not added yet; that start is tested under R-01. | Met |
| R-07 | Actuate the emergency stop while an axis is moving; measure power at both stepper drivers. | Driver power removed and all axis motion stops. | Not yet tested formally. The emergency stop is installed, and an informal test in Week 10 confirmed that it cut the driver power. The motor-supply relay has since failed with its contact closed, so driver power is not cut at the moment. The emergency stop still stops the machine, because the second relay signals the controller, which stops the step pulses. The relay will be replaced in Week 13, and the test will be run and recorded then. | Not yet tested |
| R-08 | Actuate the e-stop, reset the button, and attempt to command motion without the restart action. | No motion occurs until the deliberate restart action is performed. | Not yet tested formally. An informal test confirmed that the system restarts only after a deliberate press of Start: faults stay latched until a Start press clears them, and a second press restarts the cycle. To be documented after the relay is replaced (Week 13). | Not yet tested |
| R-09 | Monitor the communications interface through one cycle and introduce a detectable fault. | Each state transition and the active fault are transmitted with correct labels. | State reporting over Modbus is shown working in the viability video, and in the ten-cycle test video, where the monitor beside the gantry changes its operation index with each stage. A screen recording of the dashboard shows the emergency-stop fault latched and marked as the first fault. The other faults have not been shown yet. Remaining: show a fault appearing while the machine runs. | Partially met |
| R-10 | Command ten consecutive full cycles, recording cycle time, commanded/measured immersion depth, and dwell time for each. | All ten complete; no drops, no missed placements; depth and dwell within tolerance. | The ten-cycle test video shows ten complete cycles and part of an eleventh, back to back, about 65 s apart. The part was placed by hand at the input station, because there is no input table. Depth and dwell were measured on one cycle (R-04 and R-05). | Met |
| R-11 | Attach a 1 lb workpiece and command one complete cycle. | Lifts, transports, lowers, retains, and releases without stalling, losing position, slipping, or dropping. | A weight of 2.5 lb or more, above the required 1 lb, was held through a full cycle in an informal test. In the ten-cycle test, a plate that the team reports as 5 lb was carried through every cycle. A photo of a scale reading is still to be added. | Met |

## Test write-ups

One write-up per requirement, in the order of the table above, as in Section 3.4 of the report.

### R-01: Part-Ready Trigger

**Requirement.** The system shall not initiate a pick-dip-place cycle unless its part-ready trigger input is asserted. Success criterion: a cycle starts with the trigger asserted; no motion starts with it released or disconnected.

**Test setup.** A push button connected to the trigger input.

**Procedure.** Command a cycle with the trigger asserted, then release it, then disconnect it, and command a cycle each time.

**Results.** Not yet tested.

**Discussion.** The trigger input has not been added to the firmware yet, and the cycle currently starts from the Start button. Its design is described in Section 3.1.1 of the report: a pair of pins that reads as "part ready" only while it is closed, so the released and disconnected cases are the same state. The test setup is a jumper on the pair. Status: not yet tested.

**Evidence.** None yet.

### R-02: Pickup Position Accuracy

**Requirement.** The system shall position the end effector at the programmed pickup position within ±1 cm along both axes before acquiring the workpiece. Success criterion: measured error within ±1 cm along both axes.

**Test setup.** A ruler placed along each axis.

**Procedure.** The system was commanded to the programmed pickup position, and the position of the end effector was measured relative to the target.

**Results.** The X axis showed drift under 0.5 cm. The Y axis was harder to measure because the platform moves, and it was judged to be within 1 cm without a precise measurement.

**Discussion.** The X result is a measurement and meets the criterion. The Y result is an estimate, and both axes will be measured again with a recording. A later video of the X axis shows a consistent reading of about 4 cm at home across repeated moves (the X-axis consistency video), and the drift of the X axis in that video was not greater than 0.25 cm. The other X stops were not read from the video. Because each cycle homes both axes on their limit switches, the errors do not add up from one cycle to the next. Status: met.

**Evidence.** The viability video, and the X-axis consistency video.

### R-03: Workpiece Retention

**Requirement.** The system shall retain the workpiece throughout the complete pick-dip-place cycle without slipping or dropping it. Success criterion: the workpiece does not visibly slip or detach at any point.

**Test setup.** The electromagnet end effector with the approved payload.

**Procedure.** One complete pick-dip-place cycle was executed while observing the workpiece.

**Results.** The workpiece did not slip or fall in the test shown in the video. A weight of 2.5 lb or more with a minimal contact area was also held through a full cycle in an informal test.

**Discussion.** Retention exceeded the requirement in the informal test. Status: met.

**Evidence.** The viability video ("Screw not slipping test").

### R-04: Immersion Depth

**Requirement.** The system shall lower the workpiece to the programmed immersion depth within ±1 cm. Success criterion: measured depth within ±1 cm of programmed depth.

**Test setup.** A ruler beside the vertical axis at the dipping station, in view of the camera.

**Procedure.** One dip sequence was executed during the ten-cycle unattended test, and the position of the vertical axis was read on the ruler at the top and at the bottom of the move.

**Results.** The vertical axis read 9.3 cm at the top and 19.3 cm at the bottom, which is an immersion depth of 10.0 cm. The programmed depth was 100 mm, so the measured depth is within the ±1 cm tolerance.

**Discussion.** The depth was measured on one cycle. Status: met.

**Evidence.** The ten-cycle test video, in the clip with the ruler that starts at 1:38 (the exact timestamps are still to be added).

### R-05: Dwell Time

**Requirement.** The system shall hold the workpiece at the programmed immersion depth for the programmed dwell time within ±1 s. Success criterion: measured dwell within ±1 s of the programmed value.

**Test setup.** The video of the ten-cycle unattended test, measured frame by frame in DaVinci Resolve at 29.97 frames per second. A stopwatch in the shot shows that the video is not spliced.

**Procedure.** In the cycle that begins at about 9:02, the dwell was measured from the first frame in which the orange shaft coupler stops to the last frame in which it is still in the same position.

**Results.** The dwell lasted 2.10 s, from 9:16:06 to 9:18:09 in minutes, seconds, and frames. The programmed dwell was 2000 ms, so the error is +0.10 s, within the ±1 s tolerance.

**Discussion.** The dwell was measured on one cycle. Status: met.

**Evidence.** The ten-cycle test video, 9:16:06 to 9:18:09.

### R-06: Full Unattended Cycle

**Requirement.** The system shall complete one full unattended pick-dip-place cycle, beginning with the part-ready trigger and ending with workpiece release at the output station and return to the home position. Success criterion: every stage completes in order without operator intervention.

**Test setup.** The complete prototype with a workpiece at the input station.

**Procedure.** A cycle was started, and each stage was observed in order.

**Results.** Every stage completed in order without operator intervention, except the start from the part-ready trigger, because the cycle was started with the Start button. The cycle at about 9:02 to 10:07 of the ten-cycle test video shows every stage, and the operation index on the monitor beside the gantry advances through the cycle in order.

**Discussion.** The start from the part-ready trigger is tested under R-01, which is not implemented yet. Status: met.

**Evidence.** The viability video and the ten-cycle test video.

### R-07: Emergency-Stop Power Removal

**Requirement.** The system shall remove power from both stepper-motor drivers when the emergency stop is actuated. Success criterion: driver power removed and all axis motion stops.

**Test setup.** A multimeter at the supply terminals of both drivers.

**Procedure.** Actuate the emergency stop while an axis is moving and measure the power supplied to both drivers.

**Results.** Not yet tested.

**Discussion.** An informal test confirmed that the emergency stop cut driver power. The motor-supply relay then failed with its contact closed (Section 3.3.6 of the report), so the emergency stop does not currently remove driver power. It still stops the machine, because the second relay signals the controller, which stops the step pulses. The relay will be replaced in Week 13. The test must be run after the relay is replaced. Status: not yet tested.

**Evidence.** None yet.

### R-08: Restart Inhibit

**Requirement.** The system shall remain inhibited following an emergency-stop event until the emergency-stop button has been reset and the operator performs a deliberate restart action. Success criterion: no motion occurs until the deliberate restart action is performed.

**Test setup.** The complete prototype with the emergency stop installed.

**Procedure.** Actuate the emergency stop during operation, reset the button, attempt to command motion without the restart action, then perform the restart action and confirm that normal operation resumes.

**Results.** Not yet tested.

**Discussion.** An informal test confirmed that the system restarted only after a deliberate press of the Start button. The test should be documented after the relay is replaced. Status: not yet tested.

**Evidence.** None yet.

### R-09: State and Fault Reporting

**Requirement.** The system shall transmit its current operating state and any active faults through its Modbus TCP interface during operation. Success criterion: each state transition and the active fault are transmitted with correct labels.

**Test setup.** A laptop running the Modbus monitor, connected to the controller over Ethernet.

**Procedure.** Monitor the interface during one complete cycle and introduce at least one detectable fault.

**Results.** State reporting was shown working in the video. State and faults were then checked informally over Modbus during a cycle. A screen recording of the monitor (Fig. 3.14 of the report) shows the operation index, the axis positions, the inputs that show whether each axis is on target, and the highlighted stage of the cycle changing while the cycle ran. It also shows the emergency-stop fault latched and marked as the first fault, with the instruction to press Start to clear it (Fig. 3.15 of the report).

**Discussion.** Fault reporting was implemented after the viability video was recorded. The screen recording of the monitor covers the emergency-stop fault, but the other faults have not been shown on it. Status: partially met.

**Evidence.** The viability video for state reporting, and Fig. 3.15 of the report for the fault. In the ten-cycle test video, the monitor shown beside the gantry changes its operation index as the X axis moves toward the dip (9:06) and as the Y axis goes down into the bath (9:10), and the emergency-stop fault is latched and marked as the first fault at 11:51, with the message to release the emergency stop and press Start.

### R-10: Ten Consecutive Cycles

**Requirement.** The system shall complete ten consecutive unattended full pick-dip-place cycles using the approved prototype payload without dropping a workpiece, missing the intended placement position, or requiring operator intervention between cycles. Success criterion: all ten complete with no drops and no missed placements, and depth and dwell within tolerance.

**Test setup.** The complete prototype, a ruler, and a stopwatch.

**Procedure.** Command ten consecutive full cycles, recording the cycle time, commanded and measured immersion depth, and measured dwell time for each.

**Results.** The ten-cycle test video shows ten complete cycles and part of an eleventh, one after the other, with the X axis reaching the bath about every 65 s, from about 0:25 to 11:18. The part was placed by hand at the input station in every cycle, because the prototype has no input table. The depth and the dwell were measured on one cycle (R-04 and R-05).

**Discussion.** The ten cycles ran back to back. Status: met.

**Evidence.** The ten-cycle test video.

### R-11: Rated Payload

**Requirement.** The system shall complete the full pick-dip-place cycle while carrying a workpiece with a mass of 1 lb. Success criterion: the system lifts, transports, lowers, retains, and releases without stalling, losing position, slipping, or dropping.

**Test setup.** The complete prototype with a test weight.

**Procedure.** A weight was attached and one complete cycle was commanded.

**Results.** A weight of 2.5 lb or more, above the required 1 lb, was held through a full cycle in an informal test. In the ten-cycle test, a plate that the team reports as 5 lb was carried on the rod through every cycle.

**Discussion.** Both tests exceeded the rated payload. A photo of a scale reading for the plate is still to be added. Status: met.

**Evidence.** The ten-cycle test video, and the informal test recorded on the Final Testing and Results page of the website.

## Observations

Most of the system worked on the first attempt. The limit switches were very noisy when first connected and caused false faults; a 3 ms software debounce and braided wires fixed it. The motor-supply relay failed with its contact closed, and it will be replaced. The emergency stop still stops the machine through the second relay, which signals the controller. Several tests were run informally while the whole system was being tested and were not recorded, so they are marked as not yet tested until they are repeated with a recording.
