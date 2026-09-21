#figure(
  table(
    columns: (
      0.45fr,
      1.8fr,
      0.8fr,
      0.9fr,
      0.9fr,
      0.55fr,
      1fr,
    ),
    align: center + horizon,
    inset: (x: 0.5em, y: 0.5em),
    stroke: 0.5pt,

    table.header(
      [],
      [*Component*],
      [*Voltage\ (V)*],
      [*Current\ (A)*],
      [*Unit Power\ (W)*],
      [*Qty*],
      [*Total Power\ (W)*],
    ),

    // Movement module
    table.cell(
      rowspan: 2,
      align: center + horizon,
      inset: (x: 0.5em, y: 1em),
    )[
      #rotate(-90deg, reflow: true)[*Movement*]
    ],
    [Stepper motor \ (max usage per phase)],
    [48],
    [2.8],
    [134.4],
    [2],
    [268.8],

    [Stepper motor driver],
    [24–50 \ (48)],
    [0.5],
    [≈24],
    [2],
    [≈48],

    // End-effector module
    table.cell(
      rowspan: 3,
      align: center + horizon,
      inset: (x: 0.5em, y: 1em),
    )[
      #rotate(-90deg, reflow: true)[*End Effector*]
    ],
    [Electromagnet],
    [24],
    [1.12],
    [26.88],
    [1],
    [26.88],

    [Electromagnet driver],
    [5],
    [≈0.07–0.10],
    [≈0.5],
    [1],
    [≈0.5],

    [Relays when powered],
    [5],
    [0.07–0.10],
    [≈0.35–0.50],
    [1],
    [≈0.35–0.50],

    // Sensing module
    table.cell(
      align: center + horizon,
      inset: (x: 0.5em, y: 1em),
    )[
      #rotate(-90deg, reflow: true)[*Sensing*]
    ],
    [Time-of-flight sensor],
    [2.8–3.3],
    [0.019],
    [≈0.063],
    [1],
    [≈0.063],

    // Communications module
    table.cell(
      align: center + horizon,
      inset: (x: 0.5em, y: 1em),
    )[
      #rotate(-90deg, reflow: true)[*Communications*]
    ],
    [Ethernet module],
    [3.3],
    [0.132],
    [≈0.436],
    [1],
    [≈0.436],

    // Processing module
    table.cell(
      rowspan: 2,
      align: center + horizon,
      inset: (x: 0.5em, y: 1em),
    )[
      #rotate(-90deg, reflow: true)[*Processing*]
    ],
    [STM32 \ (at max rate)],
    [3.3/5],
    [≈0.1],
    [≈0.33],
    [1],
    [≈0.33],

    [Buffer ICs],
    [5],
    [≈2 µA],
    [≈0.00001 \ (negligible)],
    [1],
    [≈0.00001 \ (negligible)],

    // Total
    table.cell(
      colspan: 6,
      align: right + horizon,
      inset: (x: 0.5em, y: 1em),
    )[
      *Total operational power*
    ],
    [*345.5 W*],
  ),
  caption: [Power budget for the Safe Dip prototype.]
)<power-budget>

// #figure(
//   table(
//     columns: (
//       0.45fr,
//       1.8fr,
//       0.8fr,
//       0.9fr,
//       0.9fr,
//       0.55fr,
//       1fr,
//     ),
//     align: center + horizon,
//     inset: (x: 0.5em, y: 0.5em),
//     stroke: 0.5pt,

//     table.header(
//       [],
//       [*Component*],
//       [*Voltage\ (V)*],
//       [*Current\ (A)*],
//       [*Unit Power\ (W)*],
//       [*Qty*],
//       [*Total Power\ (W)*],
//     ),

//     // Movement module
//     table.cell(
//       align: center + horizon,
//       inset: (x: 0.5em, y: 1em),
//     )[
//       #rotate(-90deg, reflow: true)[*Movement*]
//     ],
//     [Stepper-motor and driver assembly],
//     [48],
//     [2.8],
//     [134.4],
//     [2],
//     [268.8],

//     // End-effector module
//     table.cell(
//       rowspan: 2,
//       align: center + horizon,
//       inset: (x: 0.5em, y: 1em),
//     )[
//       #rotate(-90deg, reflow: true)[*End Effector*]
//     ],
//     [Electromagnet],
//     [12],
//     [2],
//     [24],
//     [1],
//     [24],

//     [Electromagnet controller \ (MOSFET + relay)],
//     [5],
//     [≤0.20],
//     [≤1.0],
//     [1],
//     [≤1.0],

//     // Sensing module
//     table.cell(
//       align: center + horizon,
//       inset: (x: 0.5em, y: 1em),
//     )[
//       #rotate(-90deg, reflow: true)[*Sensing*]
//     ],
//     [Time-of-flight sensor],
//     [2.8–3.3],
//     [0.019],
//     [≈0.063],
//     [1],
//     [≈0.063],

//     // Communications module
//     table.cell(
//       align: center + horizon,
//       inset: (x: 0.5em, y: 1em),
//     )[
//       #rotate(-90deg, reflow: true)[*Communications*]
//     ],
//     [W5500 Ethernet controller],
//     [3.3],
//     [0.132],
//     [≈0.436],
//     [1],
//     [≈0.436],

//     // Processing module
//     table.cell(
//       rowspan: 2,
//       align: center + horizon,
//       inset: (x: 0.5em, y: 1em),
//     )[
//       #rotate(-90deg, reflow: true)[*Processing*]
//     ],
//     [STM32 Nucleo board \ (powered through 5 V pin)],
//     [5],
//     [≈0.1],
//     [≈0.5],
//     [1],
//     [≈0.5],

//     [Stepper-driver control interface \ (four STEP/DIR inputs)],
//     [5],
//     [≤0.080],
//     [≤0.400],
//     [1],
//     [≤0.400],

//     // Total
//     table.cell(
//       colspan: 6,
//       align: right + horizon,
//       inset: (x: 0.5em, y: 1em),
//     )[
//       *Theoretical maximum connected load*
//     ],
//     [*≈295.2 W*],
//   ),
//   caption: [Theoretical maximum connected-load estimate for the Safe Dip prototype.]
// )<power-budget>

#figure(
  table(
    columns: (
      1fr,
      2fr,
      1fr,
      1.2fr,
      1.2fr,
    ),
    align: (
      center + horizon,
      left + horizon,
      center + horizon,
      center + horizon,
      center + horizon,
    ),
    inset: (x: 0.6em, y: 0.6em),
    stroke: 0.5pt,

    table.header(
      [*Power Rail*],
      [*Power Adapter*],
      [*Voltage\ (V)*],
      [*Maximum Current\ (A)*],
      [*Maximum Power\ (W)*],
    ),

    [48 V],
    [Mean Well LRS-350-48],
    [48],
    [7.3],
    [350.4],

    [12 V],
    [12 V AC-DC power adapter],
    [12],
    [5],
    [60],

    table.cell(
      colspan: 4,
      align: right + horizon,
      inset: (x: 0.6em, y: 0.8em),
    )[
      *Total available power*
    ],
    [*410.4 W*],
  ),
  caption: [Maximum power available from the Safe Dip AC-DC power adapters.]
)<power-sources>

The Safe Dip prototype uses two independent AC-DC power adapters. The 48 V supply provides a maximum of 7.3 A, corresponding to approximately 350.4 W, and powers the movement subsystem. The 12 V adapter provides a maximum of 5 A, corresponding to 60 W, and powers the electromagnet and low-voltage circuitry. Together, the two adapters provide a total rated output capacity of approximately 410.4 W.