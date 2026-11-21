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

Videos of the tests. The times in the table and in the write-ups are minutes and seconds of the video named. The videos are hosted on YouTube because of their size.

**Ten-cycle unattended test with the Modbus monitor side by side** (11 min 53 s). About ten full cycles and part of an eleventh. It supports R-02, R-03, R-04, R-05, R-06, R-09, R-10 and R-11. [Open on YouTube](https://youtu.be/B5UD4GsUm4Q).

<iframe class="progress-video" style="width: 100%; aspect-ratio: 16 / 9; border: 0;" src="https://www.youtube.com/embed/B5UD4GsUm4Q" title="Ten-cycle unattended test with the Modbus monitor side by side" loading="lazy" allowfullscreen></iframe>

**Part-ready trigger test** (36 s). It supports R-01. [Open on YouTube](https://youtu.be/L0WtPBGHtws).

<iframe class="progress-video" style="width: 100%; aspect-ratio: 16 / 9; border: 0;" src="https://www.youtube.com/embed/L0WtPBGHtws" title="Part-ready trigger test" loading="lazy" allowfullscreen></iframe>

**Emergency-stop and restart test** (2 min 17 s). It supports R-07, R-08 and R-09. [Open on YouTube](https://youtu.be/yML0pdzHQa8).

<iframe class="progress-video" style="width: 100%; aspect-ratio: 16 / 9; border: 0;" src="https://www.youtube.com/embed/yML0pdzHQa8" title="Emergency-stop and restart test" loading="lazy" allowfullscreen></iframe>

**X-axis displacement consistency test** (2 min 41 s). It supports R-02. [Open on YouTube](https://youtu.be/skyr9MUUW84).

<iframe class="progress-video" style="width: 100%; aspect-ratio: 16 / 9; border: 0;" src="https://www.youtube.com/embed/skyr9MUUW84" title="X-axis displacement consistency test" loading="lazy" allowfullscreen></iframe>

The results table below records each requirement's measured value and status. Each requirement is marked Pass or Fail. The trials passed out of the trials run are in the write-ups and in Table 3.2 of the report.

## Requirements and results

| ID | Test Procedure | Pass Criteria | Measured Result | Trials passed | Pass/Fail |
|---|---|---|---|---|---|
| R-01 | Command a cycle with the trigger asserted by a push button; then release it, disconnect it, and command a cycle each time. | A cycle starts with the trigger asserted; no motion starts with it released or disconnected. | Pass. After a Start press, the sequencer waits in WAIT_FOR_PIECE and the gantry does not move while the trigger switch and its wire are handled. Motion starts only after the trigger is asserted. The asserted, released and disconnected cases are shown in the part-ready trigger test video. For the other tests the trigger is kept asserted, in most cases forced in software. | 3/3 | Pass |
| R-02 | Command the system to the programmed pickup position and measure end-effector position relative to target. | Measured error within ±1 cm along both axes. | Measured with a ruler. X: drift under 0.5 cm. Y: harder to measure because the platform moves; judged within 1 cm, not measured precisely. A later video of the X axis shows a consistent reading of about 4 cm at home across repeated moves, with the ruler read at the input, dip, and output stops on two passes (0:21 and 1:29, 0:44 and 1:44, 1:09 and 2:07), and the drift of the X axis in that video was not greater than 0.25 cm. Because each cycle homes both axes on their limit switches, the errors do not add up from one cycle to the next. | 1/1 | Pass |
| R-03 | Execute one complete pick-dip-place cycle at the approved payload. | Workpiece does not visibly slip or detach at any point. | Shown in the viability video ("Screw not slipping test"): the piece does not slip or fall. Also tested informally with a weight of 2.5 lb or more and a minimal contact area, which was held through a full cycle. | 1/1 | Pass |
| R-04 | Execute one dip sequence and measure actual immersion depth against the programmed value. | Measured depth within ±1 cm of programmed depth. | Measured with a ruler during the ten-cycle unattended test: the vertical axis read 9.3 cm at the top and 19.3 cm at the bottom, an immersion depth of 10.0 cm against a programmed depth of 100 mm. Measured on one cycle. | 1/1 | Pass |
| R-05 | Execute one dip sequence and measure the dwell period with a stopwatch. | Measured dwell within ±1 s of programmed value. | Measured frame by frame on the video of the ten-cycle unattended test: the dwell lasted 2.10 s against a programmed 2000 ms, an error of +0.10 s. Measured on one cycle. | 1/1 | Pass |
| R-06 | Command one operating cycle and confirm the trigger, acquisition, transfer, lowering, dwell, raising, transfer, release, and homing. | Every stage completes in order without operator intervention. | Every stage completes in order without operator intervention, as seen in the cycle at about 9:02 to 10:07 of the ten-cycle test video. The cycle is started with the Start button, because the part-ready trigger is not added yet; that start is tested under R-01. | 1/1 | Pass |
| R-07 | Actuate the emergency stop while an axis is moving; measure power at both stepper drivers. | Driver power removed and all axis motion stops. | Pass. The drivers' power LEDs are on and 24.14 V is measured at the drivers. Start is pressed and the motors move. With the emergency stop pressed, the motors stop, the LEDs go off, and the voltage falls to 0.000 V (1:18 to 1:28 of the emergency-stop test video). The voltage of the second driver was also measured, powered and after the stop. The press and the meter are in separate shots. | 1/1 | Pass |
| R-08 | Actuate the e-stop, reset the button, and attempt to command motion without the restart action. | No motion occurs until the deliberate restart action is performed. | Pass. The monitor shows the emergency-stop fault latched. Start pressed under the emergency stop does not move the motor. After the reset, the drivers' LEDs come back on and the monitor still shows the fault. One Start press clears the fault and a second restarts the motor (emergency-stop test video, 1:42 to 2:11). | 1/1 | Pass |
| R-09 | Monitor the communications interface through one cycle and introduce a detectable fault. | Each state transition and the active fault are transmitted with correct labels. | State reporting over Modbus is shown working in the viability video and in the ten-cycle test video, where the monitor beside the gantry changes its operation index with each stage. The emergency-stop fault is shown latched and marked as the first fault in the ten-cycle test (11:51) and in the emergency-stop test (0:56 and 1:54). The other faults were not provoked. | 1/1 | Pass |
| R-10 | Command ten consecutive full cycles, recording cycle time, commanded/measured immersion depth, and dwell time for each. | All ten complete; no drops, no missed placements; depth and dwell within tolerance. | The ten-cycle test video shows ten complete cycles and part of an eleventh, back to back, about 65 s apart. The part was placed by hand at the input station, because there is no input table, and the trigger was kept asserted. Depth and dwell were measured on one cycle (R-04 and R-05). | 10/10 | Pass |
| R-11 | Attach a 1 lb workpiece and command one complete cycle. | Lifts, transports, lowers, retains, and releases without stalling, losing position, slipping, or dropping. | A weight of 2.5 lb or more, above the required 1 lb, was held through a full cycle in an informal test. In the ten-cycle test, a plate stamped 2.27 kg / 5 lb was carried through every cycle (photo in the write-up below). The weight is the stamped value, not a scale reading. | 1/1 | Pass |

## Test write-ups

One write-up per requirement, in the order of the table above, as in Section 3.4 of the report. Each ends with the proof timeline: the times in the videos where the claim can be checked.

### R-01: Part-Ready Trigger

**Requirement.** The system shall not initiate a pick-dip-place cycle unless its part-ready trigger input is asserted. Success criterion: a cycle starts with the trigger asserted; no motion starts with it released or disconnected.

**Test setup.** A switch wired to the pair of trigger pins, the gantry in view of the camera, and the Modbus monitor on a laptop.

**Procedure.** With the machine at rest, the Start button was pressed so that the sequencer started, and the trigger was then taken through its three states: asserted, released, and disconnected.

**Results.** After the Start press, the monitor shows the sequencer waiting in `WAIT_FOR_PIECE`, and the gantry does not move while the trigger switch and its wire are handled. The motion starts only after the trigger is asserted. A cycle therefore starts with the trigger asserted, and no motion starts with it released or disconnected.

**Discussion.** The released and the disconnected cases are the same electrical state, because the input has a pull-up: both leave the input high, which means that no part is ready. The tests of the other requirements keep the trigger asserted, in most cases forced in software, so that they start from the Start button. Result: Pass.

**Evidence.** The part-ready trigger test video.

**Proof timeline** (part-ready trigger test video, 36.2 s).

- 0:01: the monitor already shows `2 · WAIT_FOR_PIECE`.
- 0:05 to 0:20: the trigger switch and its wire are handled. No motor sound is heard from 0:00 to 0:22.5, so the gantry does not move.
- 0:22.75: the first motor ramp starts, and the vertical carriage is seen moving from about 0:23 to 0:26.5.
- 0:29.75 to 0:35.25: a second vertical move.
- The team states that the asserted, released and disconnected cases are all shown; the exact time of each case is still to be added. The video ends at 0:36.2.
- For the tests of the other requirements, the trigger was kept asserted, in most cases forced in software.

### R-02: Pickup Position Accuracy

**Requirement.** The system shall position the end effector at the programmed pickup position within ±1 cm along both axes before acquiring the workpiece. Success criterion: measured error within ±1 cm along both axes.

**Test setup.** A ruler placed along each axis.

**Procedure.** The system was commanded to the programmed pickup position, and the position of the end effector was measured relative to the target.

**Results.** The X axis showed drift under 0.5 cm. The Y axis was harder to measure because the platform moves, and it was judged to be within 1 cm without a precise measurement.

**Discussion.** The X result is a measurement and meets the criterion. The Y result is an estimate, and both axes will be measured again with a recording. A later video of the X axis shows a consistent reading of about 4 cm at home across repeated moves (the X-axis consistency video), which shows the ruler reading at the input, dip, and output stops on two passes. The drift of the X axis in that video was not greater than 0.25 cm. Because each cycle homes both axes on their limit switches, the errors do not add up from one cycle to the next. Result: Pass.

**Evidence.** The viability video, and the X-axis consistency video.

**Proof timeline** (X-axis consistency video, 160.9 s). The ruler reading at each X stop, on two passes, as noted by the team: input at 0:21 and 1:29, dip at 0:44 and 1:44, output at 1:09 and 2:07. The reading at the input stop is consistent at about 4 cm. The Y axis is read on the ruler in the ten-cycle test video, in the clip that starts at 1:38.

### R-03: Workpiece Retention

**Requirement.** The system shall retain the workpiece throughout the complete pick-dip-place cycle without slipping or dropping it. Success criterion: the workpiece does not visibly slip or detach at any point.

**Test setup.** The electromagnet end effector with the approved payload.

**Procedure.** One complete pick-dip-place cycle was executed while observing the workpiece.

**Results.** The workpiece did not slip or fall in the test shown in the video. A weight of 2.5 lb or more with a minimal contact area was also held through a full cycle in an informal test.

**Discussion.** Retention exceeded the requirement in the informal test. Result: Pass.

**Evidence.** The viability video ("Screw not slipping test").

**Proof timeline** (ten-cycle test video). The workpiece is seen in the whole video, from 0:00 to 11:53, and no drop is seen. The part is placed by hand at the input station, because there is no input table.

### R-04: Immersion Depth

**Requirement.** The system shall lower the workpiece to the programmed immersion depth within ±1 cm. Success criterion: measured depth within ±1 cm of programmed depth.

**Test setup.** A ruler beside the vertical axis at the dipping station, in view of the camera.

**Procedure.** One dip sequence was executed during the ten-cycle unattended test, and the position of the vertical axis was read on the ruler at the top and at the bottom of the move.

**Results.** The vertical axis read 9.3 cm at the top and 19.3 cm at the bottom, which is an immersion depth of 10.0 cm. The programmed depth was 100 mm, so the measured depth is within the ±1 cm tolerance.

**Discussion.** The depth was measured on one cycle. Result: Pass.

**Evidence.** The ten-cycle test video, in the clip with the ruler that starts at 1:38 (the exact timestamps are still to be added).

**Proof timeline** (ten-cycle test video). Ruler readings: Y up 9.3 cm at 0:10:13 and Y down 19.3 cm at 0:36:15, as noted by the team (the timecode format is being confirmed), which is a depth of 10.0 cm. The parameters panel of the monitor shows the programmed depth, `y_down_mm = 100`, for example at 5:00.

### R-05: Dwell Time

**Requirement.** The system shall hold the workpiece at the programmed immersion depth for the programmed dwell time within ±1 s. Success criterion: measured dwell within ±1 s of the programmed value.

**Test setup.** The video of the ten-cycle unattended test, measured frame by frame in DaVinci Resolve at 29.97 frames per second. A stopwatch in the shot shows that the video is not spliced.

**Procedure.** In the cycle that begins at about 9:02, the dwell was measured from the first frame in which the orange shaft coupler stops to the last frame in which it is still in the same position.

**Results.** The dwell lasted 2.10 s, from 9:16:06 to 9:18:09 in minutes, seconds, and frames. The programmed dwell was 2000 ms, so the error is +0.10 s, within the ±1 s tolerance.

**Discussion.** The dwell was measured on one cycle. Result: Pass.

**Evidence.** The ten-cycle test video, 9:16:06 to 9:18:09.

**Proof timeline** (ten-cycle test video). In the cycle at 9:02, the orange shaft coupler stops at 9:16:06 and leaves its position after 9:18:09 (minutes, seconds, frames at 29.97 frames per second), which is 2.10 s. The programmed dwell, 2000 ms, is also shown in the parameters panel, for example at 5:00. The stopwatch in the shot shows that the video is not spliced.

### R-06: Full Unattended Cycle

**Requirement.** The system shall complete one full unattended pick-dip-place cycle, beginning with the part-ready trigger and ending with workpiece release at the output station and return to the home position. Success criterion: every stage completes in order without operator intervention.

**Test setup.** The complete prototype with a workpiece at the input station.

**Procedure.** A cycle was started, and each stage was observed in order.

**Results.** Every stage completed in order without operator intervention, except the start from the part-ready trigger, because the trigger was held asserted and the cycle was started with the Start button. The cycle at about 9:02 to 10:07 of the ten-cycle test video shows every stage, and the operation index on the monitor beside the gantry advances through the cycle in order.

**Discussion.** The trigger was held asserted for this test, and its effect on the start of a cycle is tested under R-01. Result: Pass.

**Evidence.** The viability video and the ten-cycle test video.

**Proof timeline** (ten-cycle test video). The cycle at about 9:02 to 10:07 shows every stage in order. The operation index on the monitor advances from the first operation to the last through the cycle. The trigger is assumed asserted in this test.

### R-07: Emergency-Stop Power Removal

**Requirement.** The system shall remove power from both stepper-motor drivers when the emergency stop is actuated. Success criterion: driver power removed and all axis motion stops.

**Test setup.** A multimeter at the supply terminals of the stepper drivers, with the power LEDs of the drivers in view, and the Modbus monitor.

**Procedure.** With the drivers powered, the supply voltage at the drivers was measured, the Start button was pressed so that the axes moved, and the emergency stop was pressed while they were moving.

**Results.** The motors stopped when the emergency stop was pressed, the power LEDs of the drivers went off, and the voltage at the drivers fell from 24.1 V to 0 V. The voltage of the second driver was also measured, powered and after the stop.

**Discussion.** The press of the emergency stop and the meter appear in separate shots of the video, and the motion before the press is judged by eye. The meter reads 0 V and the LEDs are off after the press, so the driver power was removed. Result: Pass.

**Evidence.** The emergency-stop and restart test video.

**Proof timeline** (emergency-stop and restart test video, 136.8 s, recorded on 2026-11-20).

| Time | Step |
|---|---|
| 0:05 | Emergency stop reset. |
| 0:08 | No emergency-stop fault on the monitor. |
| 0:16 | Power LEDs of the stepper drivers on (clearly lit at 0:20). |
| 0:30 | The meter reads 24.14 V across the drivers' supply. |
| 0:41 | Start pressed. |
| 0:46 to 0:50 | The motors move (judged by eye: no motor sound is heard). |
| 0:52 | Emergency stop pressed, and the motors stop. |
| 0:56 | The monitor shows the emergency-stop fault latched. |
| 1:10 | The LEDs of the drivers are off. |
| 1:18 to 1:28 | The meter falls from 0.637 V to 0.523 V and then to 0.000 V. |

The voltage of the second driver is also measured, powered and after the stop, as noted by the team. The meter falling to about 0.01 V and then to OL at 0:31.7 to 0:35 is not the emergency stop: it matches the probes being lifted off the terminals. The press of the emergency stop and the meter are in separate shots.

### R-08: Restart Inhibit

**Requirement.** The system shall remain inhibited following an emergency-stop event until the emergency-stop button has been reset and the operator performs a deliberate restart action. Success criterion: no motion occurs until the deliberate restart action is performed.

**Test setup.** The complete prototype with the emergency stop installed.

**Procedure.** Actuate the emergency stop during operation, reset the button, attempt to command motion without the restart action, then perform the restart action and confirm that normal operation resumes.

**Results.** After the emergency stop, the monitor shows the emergency-stop fault latched and marked as the first fault. A press of the Start button while the emergency stop was still pressed did not move the motor. After the emergency stop was reset, the LEDs of the drivers came back on and the monitor still showed the fault. The next press of Start cleared the fault, and a second press restarted the motor.

**Discussion.** The reset alone did not move the machine: a Start press was needed first to clear the fault, and a second one to restart, so no motion occurred until the deliberate restart action. Result: Pass.

**Evidence.** The emergency-stop and restart test video.

**Proof timeline** (emergency-stop and restart test video).

| Time | Step |
|---|---|
| 0:56 | The monitor shows the emergency-stop fault latched ("Latched, first"). |
| 1:42 | Start pressed while the emergency stop is still pressed. |
| 1:44 | The motor does not move. |
| 1:51 | Emergency stop reset. |
| 1:54 | The monitor still shows the fault. |
| 1:59 | The LEDs of the drivers are on again. |
| 2:08 | Start pressed: the monitor shows the faults cleared. |
| 2:11 | Start pressed again: the motor starts (the motor sound starts at about 2:09.75). |

The reset, clear and restart steps (1:51 to 2:11) were added to the original script. That Start was blocked after the reset and before the restart is shown by the clear-then-start sequence at 2:08 and 2:11.

### R-09: State and Fault Reporting

**Requirement.** The system shall transmit its current operating state and any active faults through its Modbus TCP interface during operation. Success criterion: each state transition and the active fault are transmitted with correct labels.

**Test setup.** A laptop running the Modbus monitor, connected to the controller over Ethernet.

**Procedure.** Monitor the interface during one complete cycle and introduce at least one detectable fault.

**Results.** State reporting was shown working in the video. State and faults were then checked informally over Modbus during a cycle. A screen recording of the monitor (Fig. 3.14 of the report) shows the operation index, the axis positions, the inputs that show whether each axis is on target, and the highlighted stage of the cycle changing while the cycle ran. It also shows the emergency-stop fault latched and marked as the first fault, with the instruction to press Start to clear it (Fig. 3.15 of the report).

**Discussion.** Fault reporting was implemented after the viability video was recorded. The criterion asks for at least one detectable fault, and the emergency-stop fault is shown latched and marked as the first fault, both in the ten-cycle test and in the emergency-stop test. The other faults were not provoked. Result: Pass.

**Evidence.** The viability video for state reporting, the emergency-stop test video and Fig. 3.15 of the report for the fault. In the ten-cycle test video, the monitor shown beside the gantry changes its operation index as the X axis moves toward the dip (9:06) and as the Y axis goes down into the bath (9:10), and the emergency-stop fault is latched and marked as the first fault at 11:51, with the message to release the emergency stop and press Start.

**Proof timeline.** Ten-cycle test video, with the monitor beside the gantry: the operation index changes at 9:06.4 (X toward the dip, operation 5) and at 9:10 (Y down into the bath, operation 6), and the emergency-stop fault is latched and marked as the first fault at 11:51.0, with the message to release the emergency stop and press Start. The monitor recording is black where the computer went to sleep, which the video captions: 0:00 to 1:05.8, 6:52.5 to 7:36.5, and 10:10.9 to 11:14.6. Emergency-stop test video: the same fault at 0:56 and at 1:54. The other faults (operation timed out, homing failed, limit hit, operation interrupted) were not provoked, and the report does not claim them.

### R-10: Ten Consecutive Cycles

**Requirement.** The system shall complete ten consecutive unattended full pick-dip-place cycles using the approved prototype payload without dropping a workpiece, missing the intended placement position, or requiring operator intervention between cycles. Success criterion: all ten complete with no drops and no missed placements, and depth and dwell within tolerance.

**Test setup.** The complete prototype, a ruler, and a stopwatch.

**Procedure.** Command ten consecutive full cycles, recording the cycle time, commanded and measured immersion depth, and measured dwell time for each.

**Results.** The ten-cycle test video shows ten complete cycles and part of an eleventh, one after the other, with the X axis reaching the bath about every 65 s, from about 0:25 to 11:18. The part was placed by hand at the input station in every cycle, because the prototype has no input table. The depth and the dwell were measured on one cycle (R-04 and R-05).

**Discussion.** The ten cycles ran back to back, with the part-ready trigger held asserted. Result: Pass.

**Evidence.** The ten-cycle test video.

**Proof timeline** (ten-cycle test video). The X axis reaches the bath about every 65.3 s, at roughly 0:25, 1:30, 2:35, 3:40, 4:46, 5:51, 6:56, 8:02, 9:07, 10:12 and 11:18, which makes ten complete cycles and part of an eleventh. The last X move is at about 11:18, the plate is grabbed at about 11:50, and the emergency stop is pressed at 11:51.0. The times are approximate and come from the periodicity of the audio and the 9:07 anchor.

### R-11: Rated Payload

**Requirement.** The system shall complete the full pick-dip-place cycle while carrying a workpiece with a mass of 1 lb. Success criterion: the system lifts, transports, lowers, retains, and releases without stalling, losing position, slipping, or dropping.

**Test setup.** The complete prototype with a test weight.

**Procedure.** A weight was attached and one complete cycle was commanded.

**Results.** A weight of 2.5 lb or more, above the required 1 lb, was held through a full cycle in an informal test. In the ten-cycle test, a plate stamped 2.27 kg / 5 lb (photo below) was carried on the rod through every cycle.

**Discussion.** Both tests exceeded the rated payload. The weight of the plate is the value stamped by its manufacturer, not a scale reading. Result: Pass.

**Evidence.** The ten-cycle test video, the photo of the plate below, and the informal test recorded on the Final Testing and Results page of the website.

**Proof.** The plate on the rod in the ten-cycle test video is the plate in the photo, stamped "2.27 KG / 5 LB". The weight is the manufacturer's stamped value, not a scale reading.

<figure>
	<img src="/progress/payload-plate-5lb.jpg" alt="Black cast plate stamped 2.27 KG and 5 LB on a wooden bench" style="max-width: 18rem; height: auto;" />
	<figcaption>The payload plate, stamped 2.27 kg / 5 lb.</figcaption>
</figure>

## Observations

Most of the system worked on the first attempt. The limit switches were very noisy when first connected and caused false faults; a 3 ms software debounce and braided wires fixed it. The motor-supply relay welded closed under the inrush current of the stepper drivers and was replaced. All eleven requirements passed in recorded tests. The write-ups above give the setup, the procedure and the proof of each, and they state the limits of each result: the depth and the dwell were measured on one cycle, the vertical positioning was estimated, fault reporting was shown for the emergency-stop fault only, and the weight of the payload plate is its stamped value.
