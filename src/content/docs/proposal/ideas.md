---
title: Proposed & Alternate Ideas
description: Alternative approaches considered for Safe Dip's mechanical architecture, end effector, and e-stop strategy, copied from the senior design proposal.
---

Before arriving at the proposed design, the team evaluated several alternative approaches across three key areas: the overall mechanical architecture, the end-effector mechanism, and the fail-safe strategy for power-loss events. Each alternative was assessed against the project's core priorities — operator safety, cost, mechanical simplicity, and suitability for the hot-dip environment.

## Mechanical Architecture: Gantry vs. Robotic Arm

From the start, a Cartesian gantry competed against a robotic arm design. A robotic arm presents plenty of dexterity, but came with issues regardless of its degrees of freedom:

- More degrees of freedom means more electronic and computer complexity, since each one needs at least an additional actuator.
- An arm anchored at one point, offset from the object's position, means the motors have to generate and support the entire weight of the object.
- Given the height of some hot-dipping pots, the arm would need unusually long sections — taxing the motors further just to reach deep enough into the pot and high enough to clear it while grabbing the object.

In contrast, a Cartesian gantry only needs one motor per axis, and its geometry means the structure bears most of the weight in a predictable way.

A third alternative — moving objects through the process on a conveyor belt with liquid poured from above — was also rejected: materials like hot wax would harden and break the belt, and a uniform coating would be hard to achieve.

## End Effector: Claw vs. Electromagnet

A mechanical claw is usually the first option anyone thinks of, but it comes with its own disadvantages:

- Claws need a grip strong enough that the object doesn't slip, while staying soft enough not to deform or break it.
- Grip strength depends heavily on the object's geometry and the claw's positioning.
- As payload weight increases, a pneumatic claw becomes the recommended option — introducing a new design dimension, and new complications.

An electro-permanent magnet would have been an even better fit for the project's safety-conscious goals, but its availability is limited and its price is cost-prohibitive for a prototype. The team settled on a conventional electromagnet instead — it holds the ferromagnetic workpiece by magnetic attraction rather than a mechanical grip, avoiding moving jaws near the coating bath, and releases the part simply by removing coil current.

## Emergency Stop: Category 0, 1, or 2

For a project born out of the need for a safer alternative to manual operation, a lot of thought went into how the system should behave during an emergency stop. International standard IEC 60204-1 specifies three categories of emergency stop:

- **Category 0** — uncontrolled stop by immediate removal of actuator power.
- **Category 1** — controlled stop, with power retained long enough to stop, followed by power removal.
- **Category 2** — controlled stop with actuator power remaining available.

Category 1 requires more complexity than Category 0, since it needs hardware to disconnect power after a specific time. Stepper motors could benefit from soft deceleration given the speeds they reach, but the added complexity outweighed the benefit for this project — and the microcontroller can't be trusted to trigger the power-off sequence, since it's assumed it can fail too. Category 2 simply didn't fit the project's safety requirements.

Safe Dip therefore implements a **Category 0** stop: a normally-closed, mechanically latching mushroom button wired directly into the stepper-driver power path, cutting power immediately and independently of the microcontroller. See [Engineering Standards & Compliance Codes](/standards/) for the full compliance discussion.
