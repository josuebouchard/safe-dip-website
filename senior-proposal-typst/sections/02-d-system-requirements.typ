#import "@preview/zero:0.6.1": zi
#import "../requirements.typ": sr

#pagebreak(weak: true)

#[
  #show figure: set block(breakable: true)
  #show table.cell: set block(breakable: false)
  #show table.cell: set par(justify: true)

  #figure(
    table(
      columns: (auto, 1fr, 1fr),
      align: (center + horizon, left + horizon, left + horizon),
      inset: (x: 1em, y: .75em),

      table.header(
        table.cell(align: center)[*ID*],
        table.cell(align: center)[*Requirement*],
        table.cell(align: center)[*Test*]
      ),

      sr(),
      [The system shall not initiate motion unless a workpiece is detected at the input station.],
      [Place a workpiece at the input station and command an operating cycle. The test passes if the system initiates the pick sequence. Remove the workpiece and command another cycle. The test passes if the system does not initiate motion.],

      sr(),
      [The system shall position the end effector at the programmed pickup position within $plus.minus #zi.cm[1]$ along both axes before acquiring the workpiece.],
      [Command the system to the programmed pickup position and measure the position of the end effector relative to the target. The test passes if the measured error is within $plus.minus #zi.cm[1]$ along both axes.],

      sr(),
      [The system shall retain the workpiece throughout the complete pick-dip-place cycle without slipping or dropping it.],
      [Execute one complete pick-dip-place cycle using the approved prototype payload. The test passes if the workpiece does not visibly slip or detach at any point during the cycle.],

      sr(),
      [The system shall lower the workpiece to the programmed immersion depth within $plus.minus #zi.cm[1]$.],
      [Execute one dip sequence and measure the actual immersion depth relative to the programmed value. The test passes if the measured depth is within $plus.minus #zi.cm[1]$ of the programmed depth.],

      sr(),
      [The system shall hold the workpiece at the programmed immersion depth for the programmed dwell time within $plus.minus #zi.second[1]$.],
      [Execute one dip sequence and measure the dwell period with a stopwatch or equivalent timing instrument. The test passes if the measured dwell time is within $plus.minus #zi.second[1]$ of the programmed value.],

      sr(),
      [The system shall complete one full unattended pick-dip-place cycle, beginning with workpiece detection at the input station and ending with workpiece release at the output station and return to the home position.],
      [Place a workpiece at the input station and command one operating cycle. Confirm that the system detects and acquires the workpiece, transfers it to the dipping position, lowers it to the programmed immersion depth, holds it for the programmed dwell time, raises it, transfers it to the output station, releases it, and returns to the home position. The test passes if every stage is completed in the correct order without operator intervention.],

      sr(),
      [The system shall remove power from both stepper-motor drivers when the emergency stop is actuated.],
      [Actuate the emergency stop while an axis is moving and measure the power supplied to both stepper-motor drivers. The test passes if driver power is removed and all axis motion stops.],

      sr(),
      [The system shall remain inhibited following an emergency-stop event until the emergency-stop button has been reset and the operator performs a deliberate restart action.],
      [Actuate the emergency stop during operation, reset the emergency-stop button, and attempt to command motion without performing the restart action. The test passes if no motion occurs. Perform the deliberate restart action and confirm that normal operation can be re-established.],

      sr(),
      [The system shall transmit its current operating state and any active faults through the selected communications interface during operation.],
      [Monitor the communications interface during one complete operating cycle and introduce at least one detectable fault condition. The test passes if each operating-state transition and the active fault are transmitted with the correct labels.],

      sr(),
      [The system shall complete ten consecutive unattended full pick-dip-place cycles using the approved prototype payload without dropping a workpiece, missing the intended placement position, or requiring operator intervention between cycles.],
      [Command the system to perform ten consecutive full pick-dip-place cycles using the approved prototype payload. Record the cycle time, commanded immersion depth, measured immersion depth, and measured dwell time for each cycle. The test passes if all ten cycles are completed, no workpiece is dropped, no placement is missed, and the measured immersion depth and dwell time remain within their specified tolerances.],

      sr(),
      [The system shall complete the full pick-dip-place cycle while carrying a workpiece with a mass of 1 lb.],
      [Attach a 1 lb workpiece and command one complete pick-dip-place cycle. The test passes if the system lifts, transports, lowers, retains, and releases the workpiece without stalling, losing position, slipping, or dropping it.]
    ),
    caption: [System requirements and verification criteria]
  )
]