#import "@preview/zero:0.5.0": zi, ztable
#import "../template.typ": chapter, todo

#chapter(
  description: [This chapter describes the proposed design of Safe Dip in detail. We explain the system's two-axis Cartesian gantry architecture and define its operating limitations. We present the testable system requirements and their verification criteria, describe each functional module through a system block diagram, provide engineering specifications for each subsystem, and outline the project budget.]
)[Proposed Work]

// Describe exactly what you will do to obtain a solution. Suitable content for this section should include, but is not limited to:
// 1. Explain your project in detail. Clearly mention if your project has operating limitations.
// 2. Clearly explain the system requirements of your project.
// 3. Establish a matrix or a table to show how testing of your project will be performed and what the criteria for success will be, i.e., different conditions under which you will test your project to establish the success for each of the project requirements.
// 4. Include a detailed block diagram of your proposed design. Explain each block clearly.
// 5. Include engineering specifications for each block. An example is shown in the table below.
// 6. Discuss different hardware and software components that you are considering to satisfy your engineering specifications.
// 7. Show a table with group members’ responsibilities towards the implementation of the project.
// 8. Establish a power budget for your project.
// 9. Include Preliminary Work completed for your project (very important)

== Overview of Safe Dip

Safe Dip is a two-axis Cartesian gantry system designed to automate the pick, dip, and place cycle of a hot-melt coating operation. The horizontal axis is driven by a timing belt coupled to a stepper motor along a pair of linear rails, providing smooth and repeatable travel between the input conveyor, the dipping pot, and the output conveyor. The vertical axis is driven by a leadscrew, which is mechanically self-locking, based on its pitch and the workpiece's weight, meaning that the carriage holds its position without active braking in the event of a power loss or fault. The lead nut is mounted directly to the horizontal slider, so the entire vertical assembly raises and lowers as a unit, keeping the gantry clear of the dipping pot during horizontal travel. Together, these two axes execute a coordinated motion sequence that lifts parts from an input position, lowers them into the heated coating bath for a controlled dwell period, withdraws them, and deposits them at an output position, removing the operator from direct contact with the hazardous thermal environment.

The prototype operates at a reduced payload and process temperature relative to the full industrial specification in order to meet laboratory safety requirements. The control architecture, communications stack, and safety system topology are nonetheless implemented at full fidelity, and design calculations provided in this report demonstrate how the system scales to the industrial target.

== Operating Limitations

The following constraints define the boundaries within which Safe Dip is designed to operate, which are outside the control of the system. They are not subject to pass/fail testing, but scope the design and inform component selection.

#v(1em)
- Safe Dip operates along two axes only: a horizontal axis for transfer between the input station, dipping bath, and output station, and a vertical axis for picking, dipping, and placing the workpiece. The system does not support rotation or movement perpendicular to the horizontal travel path.
- The system is designed to handle cylindrical workpieces within the specified size and payload limits.
- Workpieces must be presented at a known, fixed input position. The system does not perform lateral alignment, orientation correction, or vision-based localization.
- Each workpiece must provide a clean, flat, ferromagnetic attachment surface that remains outside the required coating area. Because the electromagnet remains in contact with this surface throughout the cycle, the attachment area will not be dipped or coated. Workpieces requiring complete surface coverage would require a different end effector or a secondary coating operation.
#v(1em)

For the laboratory prototype, the following additional operating limitations apply:

#v(1em)
- The laboratory prototype is designed and validated for workpieces with a maximum mass of 1 lb. Operation above this payload is outside the prototype's validated operating range.
- The prototype shall not be operated with a heated dipping bath or exposed to temperatures beyond the rated limits of its selected components. All acceptance testing will be performed using an unheated, laboratory-safe medium under room-temperature conditions.
- The prototype does not validate operation near molten wax, heated resin, process fumes, splashing hot material, or other industrial hot-dip conditions.
#v(1em)

This limitation keeps the prototype safe and practical to demonstrate in the laboratory. Using molten wax or another heated material would introduce burn, splash, spill, and fume hazards that would require additional protective equipment and facilities. Heat could also affect the frame, wiring, sensors, motors, lubrication, and end effector.

Although these issues would need to be addressed in an industrial version, detailed thermal and mechanical design is outside the main scope of the ECET prototype. The project therefore focuses on demonstrating the electrical, control, sensing, communication, and safety systems at room temperature.

== System Requirements

Each requirement below describes a specific, observable behavior with a defined pass condition. The system is treated as a black box for these requirements, and emphasis is placed on interactions with system boundaries, the required level of performance, and physical requirements.

#include "02-d-system-requirements.typ"


== Project Modules

// Block diagram + especifications for each module

The Safe Dip system can be divided into 7 modules as shown in @block-diagram:general.

#figure(
  image("../images/block-diagram/00-system.svg"),
  caption: [System-wide block diagram],
  placement: auto
)<block-diagram:general>

#v(.75em)

The power distribution module is composed of the power supply and is in charge of converting wall power into the different types of voltage needed.

The E-stop module will contain all the mechanisms needed to perform a category-0 emergency stop, able to cut the power to the movement module. It is also in charge of alerting the processing module about the E-stop so that it can handle it gracefully.

The processing module is the heart of the system, encapsulating the microcontroller, which receives all inputs and translates them into the corresponding actuator responses. It also includes any and all components to ensure that the incoming data is at an acceptable input voltage for the microcontroller. This module receives its power from the power distribution module, and through the microcontroller's on-board power converter, it feeds #zi.V[3.3] to the other modules.

The sensing module is composed of all the time-of-flight (TOF) sensors used in this project, as well as limiting switches and other sensors.

The movement module is composed of all the stepper motors and controllers required for the horizontal movement of the gantry and the movement of the vertical assembly.

The effector module controls the part of the system that will grab the object and is composed of an electromagnet. It will, nonetheless, be designed to be as modular as possible, ensuring that a change of effector type may not be too hard to implement.

The communications module is an addition to the processing module in case communications are decided to be done via Ethernet TCP-Modbus. It would include a module capable of Ethernet communications.

The functional modules described above are expanded in @block-diagram:hardware to show the proposed electrical implementation of Safe Dip and the interfaces between its major components. The diagram identifies the system's power-distribution paths, control signals, sensor connections, communication interfaces, and actuator drivers. It also distinguishes between the high-power circuitry used by the motion and end-effector subsystems and the low-voltage circuitry used by the processing, sensing, and communications modules. This hardware-level representation provides the basis for selecting components, defining subsystem specifications, preparing the power budget, and verifying that the modules can operate together as an integrated system.

#v(1em)

#figure(
  image("../images/block-diagram/01-hardware-architecture.svg"),
  caption: [Hardware architecture],
)<block-diagram:hardware>

== System Specification <sec:specs>


#include "02-a-system-specification.typ"

== Power Budget

#include "02-b-power-budget.typ"

== Project's Hardware

The components selected for Safe Dip were chosen to satisfy the engineering specifications defined in @sec:specs while remaining within the project's budget constraint and accessible through standard commercial channels. The hardware is divided into two categories: the electronics responsible for control, motion, sensing, and communications, and the structural components that form the physical frame of the gantry.

=== Mechanical structure

The structural frame and motion transmission of Safe Dip are built from standard commercial extrusion and linear-motion components, selected so the preliminary dimensions listed in @cad-dimensions can be met without custom machining.

The frame is assembled from 4040 T-slot aluminum extrusion, which forms the horizontal beam, the vertical column, and the supporting legs shown in @cad-model. The T-slot profile allows components to be mounted at arbitrary positions along each beam and secured with T-nuts and M5 hardware, which simplifies alignment during assembly and permits adjustment of the input, dipping, and output station positions.

The horizontal axis is guided by an MGN12H linear rail and carriage and driven by a GT2 timing belt, converting the rotation of the horizontal NEMA 23 into the linear travel between stations described in @cad-dimensions. The vertical axis uses a Tr8x2 leadscrew supported by pillow-block bearings and coupled to the vertical NEMA 23 through a flexible shaft coupler; the leadscrew converts motor rotation into the controlled lifting and immersion motion, and its selection is supported by the leadscrew speed and payload calculations in #link(<appendix:calculations>)[Appendix A]. An anti-backlash nut block is used on the leadscrew to remove axial play so that programmed immersion depth remains repeatable across cycles.

#import "@preview/subpar:0.2.2"

#v(-1em)
#figure(
  image("../images/CAD-model.png", width: 90%),
  caption: [Preliminary CAD model of the proposed Safe Dip mechanical arrangement -\ Perspective view]
)<cad-model>
#figure(
  image("../images/CAD-model-front.png", width: 90%),
  caption: [Preliminary CAD model of the proposed Safe Dip mechanical arrangement -\ Front view]
)

#v(1em)

The CAD model in @cad-model illustrates the proposed mechanical arrangement of the Safe Dip prototype. The model is preliminary and is intended to show the relative placement of the horizontal axis, vertical assembly, input station, dipping station, output station, and end effector. Final dimensions will be established after the selected mechanical components are measured and the required axis travel and clearances are verified.

#include "02-c-cad-datum.typ"

=== E-Stop and Protection module

The emergency-stop and protection hardware satisfies the requirements in @table:module:e-stop. Its purpose is to remove power from the motor drivers independently of the STM32 while treating the electromagnet as a load-holding device. This arrangement stops the hazardous motion without causing the suspended workpiece to fall into the coating bath.

A normally closed, mechanically latching mushroom emergency-stop button is wired directly into the stepper-driver power path. When the button is actuated, its contacts open immediately and remove power from the DM542TE drivers, causing the axes to coast to a standstill and implementing a Category 0 stop. Because the stop path is hardwired and normally closed, either pressing the button or breaking a wire opens the circuit without requiring any action from the microcontroller. The button remains latched until it is manually reset, satisfying the “requires manual reset” requirement in @table:module:e-stop.

This stop path is intentionally independent of firmware and electronic control logic. IEC 60204-1 requires a Category 0 emergency stop to operate through hardwired electromechanical components rather than depending on electronic logic @iec-60204-1:.

A separate relay controls the electromagnet coil supply and is not included in the Category 0 cutoff. The electromagnet is treated as a load-holding device rather than as a hazardous actuator that must be immediately de-energized. Removing power from it during an emergency stop could create a secondary hazard by releasing the suspended ferromagnetic part into the coating bath. IEC 60204-1 requires the emergency-stop function to avoid creating such additional hazards @iec-60204-1. The electromagnet therefore remains energized during the stop, and the part is released in a controlled manner only after motion has ceased.

An inline fuse holder provides overcurrent protection for the switched supply rail, while the resistor kit provides the gate and pull resistors required by the relay and associated switching stages. A passive buzzer provides an audible indication whenever a fault or emergency-stop condition is active.


#figure(
  image("../images/hardware/e-stop.png", width: 25%),
  caption: [E-stop mushroom button]
)

=== Sensing Module

The sensing hardware provides the workpiece-presence and axis-homing feedback required for the sense-pick-dip-place sequence and satisfies the requirements in @table:module:sensing.

A VL53L0X time-of-flight sensor detects the presence of a workpiece at the input station before a cycle begins. It operates at 3.3 V and communicates over I2C, making it directly compatible with the STM32 without additional level shifting. Its short blind zone and detection range are suitable for covering the input station as required in @table:module:sensing.

Normally-closed KW12-3 micro limit switches provide the homing and travel references for each axis. One switch is placed at an axis end so that, on startup, each axis can be driven toward it to establish a known home position; the normally-closed configuration ensures that a disconnected or failed switch is detected as an actuated state rather than being ignored. Together with the ±1 cm positional accuracy of the movement subsystem (@table:module:movement), this homing reference allows the controller to reach the input, dipping, and output stations repeatably.

#figure(
  image("../images/hardware/vl53l0x.jpg", width: 15%),
  caption: [vl53l0x ToF sensor]
)

=== Power Distribution Module

This system will require three main voltage lines, one at 24-48 V for the stepper motor controllers, another at #zi.V[12] for the effector, and finally one of #zi.V[5] for the processing module. To that end, two different power supplies will be used for the #zi.V[48] and #zi.V[12] lines, while a DC-DC buck converter will be responsible for generating the #zi.V[5] line.

The Mean Well LRS-350-48 is an AC-DC power supply that converts 110 or 220 Vrms into #zi.V[48]. It has four parallel terminals for the output, and it can supply a maximum current of #zi.A[7.3].

#figure(
  image("../images/hardware/meanwell.png", width: 40%),
  caption: [Mean Well LRS-350-48 AC-DC power supply]
)

The less stringent requirements of the #zi.V[12] line means that it can be provided by an off-brand transformer, as long as it complies with the specifications. In this case, an ALITOVE DC 12V 5A Power Supply was chosen.

#figure(
  image("/images/hardware/12v-transformer.jpg", width: 50%),
  caption: [ALITOVE DC 12V 5A Power Supply]
)

Finally, for the #zi.V[5] line, as shown in @block-diagram:hardware, a HiLetgo buck converter based on the XL4016 chip was chosen.

#figure(
  image("../images/hardware/buck-converter.png", width: 30%),
  caption: [HiLetgo buck converter]
)

=== Processing Module

The STM32 NUCLEO-F446RE serves as the microcontroller responsible for coordinating the efforts for the sense-pick-dip-place sequence. It features an ARM Cortex-M4, 32-bit, #zi.V[3.3] microcontroller operating at a maximum frequency of 180 MHz. The STM32 family is widely adopted in embedded industrial designs due to its peripheral density, which allows for tight deterministic loops.

This board provides the necessary computing bandwidth to manage the real-time state machine while simultaneously running communication tasks. Crucially, its advanced hardware timers can be utilized in Output Compare mode to generate precise, jitter-free frequency pulses for step generation without taxing the CPU. Furthermore, its configurable interrupts can be used to immediately respond to external signals or to timer completion. The ability to delegate tasks to specialized hardware enables the Nucleo board to perform communication tasks with other peripherals.

#figure(
  image("/images/hardware/nucleo-board.png", width: 50%),
  caption: [STM32 Nucleo-F446RE microcontroller board]
)

Given that the Nucleo board operates using #zi.V[3.3] logic, it will require a buffer for communicating with the stepper controllers. To that end, something like the 74HCT244 for boosting the signal to #zi.V[5].

#figure(
  image("/images/hardware/74HCT244.png", width: 20%),
  caption: [74HCT244 Octal Buffers and Line Drivers]
)

=== Movement Module

For both the horizontal and vertical movement, a NEMA 23 stepper motor will be used for each axis. For this project, StepperOnline's 23HS22-2804S NEMA 23 stepper motor was chosen due to its static torque of 1.24 Nm and dynamic torque of almost 0.9 Nm at 150 RPM.

#figure(
  image("../images/hardware/nema23.png", width: 30%),
  caption: [NEMA 23 23HS22-2804S stepper motor]
)

To drive the NEMAs using a microcontroller, a stepper motor controller is required to set their speed and direction. The DM542TE is capable of tolerating up to 48 V and accepting 5 V signals.


#figure(
  image("../images/hardware/stepper-controller.png", width: 45%),
  caption: [DM542TE stepper controller]
)

=== End Effector Module

The end-effector hardware holds the ferromagnetic workpiece throughout the pick-dip-place cycle and switches it under microcontroller control, satisfying the requirements in @table:end-effector.

A Baomain BM-P 80-38 electromagnet is used as the gripping element. It holds the ferromagnetic workpiece by magnetic attraction rather than a mechanical grip, which avoids moving jaws near the coating bath and lets the part be released simply by removing coil current. Its holding force is sized to retain the rated payload for the full duration of the dip, as required in @table:end-effector, and it is driven from a single microcontroller output.

An IRLZ44N logic-level MOSFET switches the electromagnet coil from a single 3.3 V/5 V STM32 GPIO. It was chosen because its logic-level gate is compatible with the microcontroller output, and its drain-source voltage and continuous drain-current ratings comfortably exceed the 12 V electromagnet supply and coil current with transient margin, matching the MOSFET-driver requirements in @table:end-effector.

A 1N4007 flyback diode is placed across the electromagnet coil to protect the MOSFET and GPIO from the inductive back-EMF generated when the coil is de-energized, addressing the "no damaging voltage transient" condition in the @table:end-effector verification.

#figure(
  image("../images/hardware/electromagnet.png", width: 30%),
  caption: [Baomain BM-P 80-38 electromagnet]
)
=== Communications Module

Communications between Safe Dip and the user are divided into two categories for this project: a base case and an extension goal. For the base case, the NUCLEO-F446RE's UART peripheral, along with the ST-LINK connector on the board, will be used.

For the extension goal to communicate using Modbus-TCP, a W5500 was chosen. The W5500 is a standalone Ethernet module with a full TCP/IP stack implemented in the hardware/firmware on the chip itself. This means that the microcontroller doesn't have to run a TCP/IP stack, but instead it only has to communicate with the module via SPI.

#figure(
  image("../images/hardware/w5500.png", width: 40%),
  caption: [W5500 Ethernet module]
)

== Project's Software

=== Software Platform, Libraries, and Integration

The Safe Dip firmware will be developed for the STM32 NUCLEO-F446RE using STM32CubeMX and the STM32 Hardware Abstraction Layer (HAL). STM32CubeMX will be used to configure the microcontroller clock, GPIO pins, hardware timers, external interrupts, UART, and SPI peripherals. It will also generate the initial peripheral setup code, reducing the amount of low-level configuration that must be written manually and helping ensure that the selected pins and peripheral functions are compatible.

#figure(
  image("/images/software-platform-libraries/stm32cubemx.png"),
  caption: [STM32CubeMX graphical interface]
)

The STM32 HAL library will provide the main interface between the application software and the microcontroller peripherals. HAL functions will be used to initialize and control the timers responsible for generating the stepper-motor STEP signals, configure the direction and end-effector outputs, read sensor and limit-switch inputs, and communicate with external devices. Interrupt callbacks provided by HAL will also be used for events such as emergency-stop activation, timer completion, and communication activity. Application-specific behavior, including movement sequencing and safety handling, will remain separate from the generated HAL initialization code.

Ethernet communication will be implemented using the WIZnet W5500 controller. The W5500 communicates with the STM32 through SPI and provides hardware support for Ethernet, IP, TCP, and UDP communication. The WIZnet socket library will be used to configure the controller and manage its hardware sockets without requiring the STM32 to execute a complete software TCP/IP stack.

A small integration layer will connect the WIZnet library to the STM32 HAL implementation. This layer will provide the SPI transfer operations, chip-select control, controller reset, timing functions, and any interrupt handling required by the W5500 library. Keeping this code separate from both the vendor library and the application logic will make it easier to update or replace either side without modifying the complete communications implementation.

Modbus TCP will be implemented above the W5500 socket interface. The communications module will translate between Modbus requests and the internal state of the Safe Dip system, exposing information such as the operating mode, active instruction, gantry position, sensor values, and fault status. Commands received through Modbus will be validated before being passed to the control software so that communications code does not directly manipulate motors, timers, or other hardware peripherals.

Together, STM32CubeMX, the STM32 HAL, the WIZnet library, and the custom integration code provide a layered software platform. Vendor libraries will handle hardware-specific peripheral access, while the project-specific modules will implement movement control, end-effector control, safety behavior, sequencing, and communications.

=== Software Architecture and Control Flow

The Safe Dip control software will be implemented on the STM32 microcontroller using a cooperative, nonblocking architecture. Rather than executing the complete pick-dip-place cycle as one blocking function, the software will be divided into several modules that are processed repeatedly from the main loop. These modules include the cycle sequencer, movement controller, end-effector controller, dwell timer, and communications interface.

Each processing function will perform a bounded amount of work and return immediately. This allows the controller to remain responsive to safety inputs and communication requests while a movement, effector operation, or timed operation is still in progress.

#figure(
  image(
    "/images/software/Main Structure.svg",
    height: 75%,
  ),
  caption: [Main software execution structure],
  placement: auto
)<flowchart:main-structure>

As shown in @flowchart:main-structure, the software first initializes
the microcontroller peripherals and the internal state of each module.
It then enters a continuous main loop. During each iteration, the
program steps the cycle sequencer, processes the movement module,
processes the end-effector module, updates the dwell timer, and services
the communications interface.

This structure implements cooperative multitasking. Each module is
given an opportunity to perform its current work, but no module is
allowed to block execution while waiting for an operation to finish.
The movement, effector, and timer modules therefore continue operating
over multiple iterations of the main loop while the sequencer monitors
the progress of the current instruction.

The movement module will be responsible for the low-level control of the
two stepper motors. Its responsibilities include setting the direction
signals, generating the STEP waveforms using STM32 hardware timers,
counting completed steps, applying acceleration and deceleration
profiles, and stopping each axis at the requested position. The
end-effector module will control the engagement and disengagement of the
magnetic tool, while the timer module will manage the programmed dwell
period.

These implementation details will remain encapsulated inside their
respective modules. The cycle sequencer will not directly manipulate
timer registers, GPIO pins, motor step counts, or acceleration
parameters.

#place.flush()
==== Normal Cycle Sequence

The normal operating cycle is represented as an ordered sequence of
nonblocking instructions, as shown in @flowchart:normal-cycle. The
instructions are grouped into five process stages: home, pick, dip,
deposit, and release.

#figure(
  image(
    "/images/software/Cycles Normal Sequence.svg",
    width: 100%,
  ),
  caption: [Normal pick-dip-place instruction sequence],
  placement: auto,
)<flowchart:normal-cycle>

Each instruction represents an absolute objective rather than a
blocking procedure. For example, `MOVE_Z_UP` requests that the vertical
axis move to its configured upper position. The movement module starts
the operation and returns immediately. The sequencer continues to
monitor the instruction until the movement module reports that the
target has been reached.

#place.flush()
==== Cycle Sequencer

The cycle sequencer maintains an instruction index identifying the current entry in the normal sequence. It also evaluates the state of the current instruction. An instruction may be `IDLE`, `RUNNING`, `FINISHED`, or `ABORTED`, and it is the corresponding module's job to indicate what its state is, as later shown in @flowchart:instruction-status.

While the instruction is running, the sequencer processes its current status but does not start another instruction. In this
condition, the sequencer effectively performs no additional sequencing work during that iteration. Control immediately returns to the main loop so that movement, effector, timer, and communication processing can continue.

When the responsible module reports that the instruction has finished,
the sequencer advances the instruction index and starts the next entry
in the normal sequence. Once the final instruction has been completed, the
index returns to the beginning of the sequence.

If the system enters the stopping condition, the sequencer sends abort
requests to the movement, effector, and timer modules. Once the system
has stopped, the current instruction is considered aborted, and it is the module's responsibility to report it as such. The
instruction index is reset before another normal cycle is permitted to
begin. This prevents the system from continuing from the middle of an
instruction whose physical state may no longer be known.

#figure(
  image(
    "/images/software/Sequencer.svg",
    width: 100%,
  ),
  caption: [Cooperative cycle sequencer],
)<flowchart:sequencer>

#place.flush()
==== Starting an Instruction

Instruction dispatch is separated from the internal implementation of
the movement, end-effector, and timer modules. The sequencer identifies
which module is responsible for the current instruction and communicates
with that module only through its public interface.

#figure(
  image(
    "/images/software/Start instruction.svg",
    width: 75%,
  ),
  caption: [Dispatching the current instruction to its responsible module],
  placement: auto,
)<flowchart:start-instruction>

As illustrated in @flowchart:start-instruction, instructions beginning with `MOVE_X_*` or `MOVE_Z_*` are dispatched to the movement module. Instructions beginning with `EFFECTOR_` are dispatched to the end-effector module. The `DWELL` instruction is dispatched to the timer module. Each module provides a start operation that configures the requested action and returns immediately. For example, starting a movement may configure the required direction, target step count, acceleration profile, and timer channel before enabling the STEP waveform. The function does not wait for the motor to reach its target.

Similarly, starting the dwell instruction configures and starts the
timer without waiting for the timer to expire. Consequently,
dispatching an instruction does not block execution of the cooperative
main loop.

#place.flush()
==== Instruction-State Evaluation

Once an instruction has been started, the sequencer must determine
whether its responsible module is still running, has completed, or has
been aborted.

#figure(
  image(
    "/images/software/Instruction state.svg",
    width: 80%,
  ),
  caption: [Evaluation of the current instruction state],
  placement: auto,
)<flowchart:instruction-status>

The instruction-state function uses the same instruction classification as the dispatch operation. For a movement instruction, it returns the status reported by the movement module. For an end-effector instruction, it returns the status reported by the end-effector module. For the `DWELL` instruction, it returns the status reported by the timer module.

The sequencer therefore coordinates the complete production cycle
without knowing how the individual modules implement their operations.
It does not need to know which hardware timer is assigned to an axis,
which GPIO pins control the stepper drivers, how many steps remain, or
how the acceleration profile is calculated.

This produces a clear abstraction boundary. The sequencer knows the
public interfaces provided by the movement, effector, and timer modules,
but those modules do not need to know the structure of the complete
pick-dip-place sequence. The modules can therefore be developed and
tested independently by issuing commands and observing their reported
status.

==== Emergency-Stop Handling

The emergency-stop input is processed asynchronously using an external
interrupt. This allows the microcontroller to detect the E-stop
regardless of which instruction or main-loop function is currently
being processed.

#figure(
  image(
    "/images/software/E-stop interrupt.svg",
    width: 80%,
  ),
  caption: [Emergency-stop interrupt handling],
  placement: auto,
)<flowchart:estop-interrupt>

The interrupt service routine performs only the minimum processing
required to record the state of the E-stop input. When the E-stop is
asserted, the routine sets the system status to `STOPPING` and returns.
It does not directly execute the complete stopping sequence inside the
interrupt context.

During the next execution of the sequencer, the `STOPPING` status causes
abort requests to be sent to the movement, end-effector, and timer
modules. Each module is responsible for placing its own operation and
peripherals into the requested stopped or safe condition. The movement
module, for example, will stop the active acceleration profile and
disable the appropriate STEP-generation timers.

After the abort requests have been processed, the software changes the
system status to `STOPPED`. The current sequence instruction is then
marked as aborted, and the instruction index is reset before another
normal cycle can begin.

Releasing the E-stop will not automatically resume the interrupted
instruction. A deliberate operator reset will be required before
operation is restored. The software will then re-establish a known
gantry position and restart the sequence from a defined boundary rather
than attempting to continue from a partially completed movement.

The software-controlled response supplements the independent hardware
safety circuitry. The hardwired E-stop mechanism remains responsible
for enforcing the final removal of actuator power if the controlled
software response cannot be completed within the permitted time.

Overall, this architecture combines cooperative scheduling with
asynchronous peripheral operation. Hardware timers and interrupts
perform timing-sensitive work, while the main loop coordinates
higher-level operations through the sequencer. This approach keeps the
normal production sequence easy to understand while isolating the
detailed control of the motors, end effector, dwell timer, and
communications interface inside dedicated software modules.



== Preliminary work

=== Modbus TCP Communications Prototype

Preliminary work has been completed on the communications subsystem through the development of a portable Modbus server library in C. The library separates the Modbus protocol from the target hardware by receiving raw protocol data units and accessing application data through user-provided callback functions. This allows the same protocol implementation to be tested on a desktop computer and later integrated into the STM32 firmware without introducing hardware-specific dependencies into the library. The implementation avoids dynamic memory allocation and organizes the supported Modbus function codes into separate modules. :contentReference[oaicite:0]{index=0}

The library currently includes dispatch support for coils, discrete inputs, input registers, and holding registers. Incoming requests are validated before application data is accessed, and protocol exception responses are generated for unsupported functions, invalid addresses, invalid values, and internal failures. The public interface exposes a central PDU dispatcher, while a context structure containing read and write callbacks connects Modbus addresses to the Safe Dip application state. :contentReference[oaicite:1]{index=1} :contentReference[oaicite:2]{index=2} :contentReference[oaicite:3]{index=3}

A Modbus TCP layer has also been implemented to process the Modbus Application Protocol header and forward the enclosed PDU to the protocol dispatcher. This layer uses a small state machine that first receives and parses the seven-byte MBAP header and then requests the remaining PDU bytes. This structure supports nonblocking communication because the STM32 does not need to wait for an entire request in one operation. :contentReference[oaicite:4]{index=4} :contentReference[oaicite:5]{index=5}

The TCP implementation was integrated with the STM32 and W5500 Ethernet library through SPI. In this arrangement, the W5500 hardware manages the Ethernet and TCP socket operations, while the STM32 periodically checks the socket state, receives available request bytes, dispatches completed Modbus messages, and transmits the resulting responses without blocking the main control loop.

Initial hardware testing was performed using `madbus-cli` as a Modbus TCP client. The test successfully read coil values, wrote individual coils, wrote several coils in one request, and read the values back from the STM32. The results shown in @figure:modbus-test confirm preliminary operation of the read-coils, write-single-coil, and write-multiple-coils functions through the complete computer-to-W5500-to-STM32 communication path.

#figure(
  image(
    "/images/madbus-test.png",
    width: 70%,
  ),
  caption: [Preliminary Modbus TCP coil read and write testing using `madbus-cli`],
  placement: auto,
)<figure:modbus-test>

This preliminary implementation reduces the remaining communications work to defining the final Modbus address map and connecting its callbacks to the Safe Dip operating state, gantry position, sensor information, configuration values, and fault data.

=== Stepper-Motor Signal Prototype

Preliminary work was also performed on the generation of the stepper-motor STEP signal using the STM32 hardware timers. TIM2 was configured in Output Compare toggle mode so that the timer peripheral, rather than the main application loop, controls the output transitions. After each compare event, the interrupt callback schedules the next transition by advancing the compare register by a configurable number of timer ticks. Changing this interval changes the STEP frequency without requiring software delays or a blocking pulse-generation loop.

This experiment establishes the basic mechanism that will later be incorporated into the movement module. The module will extend the prototype with pulse counting, acceleration and deceleration, target-position tracking, and independent control of both axes. Testing performed at this stage was limited to timer configuration and STEP waveform generation; operation with the selected stepper drivers and motors remains part of the final implementation and verification.

#import "@preview/codly:1.3.0": *
#show: codly-init.with()
#import "@preview/codly-languages:0.1.9": *
#codly(languages: codly-languages)

#figure(
  ```c
  // Dynamically controls the half period
  static volatile uint32_t half_period_ticks = 500U;
  
  // Stepper start function
  void stepper_start(void) {
    // Get counter
    uint32_t now = __HAL_TIM_GET_COUNTER(&htim2);
  
    // Set Capture/Compare Register as `now + half_period_ticks`
    __HAL_TIM_SET_COMPARE(&htim2, TIM_CHANNEL_1, now + half_period_ticks);
  
    // Start timer + interrupt
    HAL_TIM_OC_Start_IT(&htim2, TIM_CHANNEL_1);
  }
  
  // Timer compare interrupt
  void HAL_TIM_OC_DelayElapsedCallback(TIM_HandleTypeDef *htim) {
    // Check it comes from correct timer and channel
    if ((htim->Instance == TIM2) && (htim->Channel == HAL_TIM_ACTIVE_CHANNEL_1)) {
  
      // Get Capture/Compare Register
      uint32_t previous_compare = __HAL_TIM_GET_COMPARE(htim, TIM_CHANNEL_1);
  
      // Set updated Capture/Compare Register
      __HAL_TIM_SET_COMPARE(htim, TIM_CHANNEL_1,
                            previous_compare + half_period_ticks);
    }
  }
  ```,
  caption: [Snippet for STEP square wave generator],
  kind: image,
)