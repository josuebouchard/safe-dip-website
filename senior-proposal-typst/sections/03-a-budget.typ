#[
  #show figure: set block(breakable: true)

  #figure(
    table(
      columns: (1.15fr, 2.15fr, 0.45fr, 0.7fr),
      align: (
        left + horizon,
        left + horizon,
        center + horizon,
        right + horizon,
      ),
      inset: (x: 0.45em, y: 0.35em),
      stroke: 0.45pt,

      table.header(
        [*Item*],
        [*Component*],
        [*Qty.*],
        [*Price total*],
      ),

      [Single Output Switchable Power],
      [Mean Well LRS-350-48],
      [1],
      [\$35.06],

      [Microcontroller],
      [STM32 NUCLEO-F446RE],
      [1],
      [\$31.00],

      [4-channel digital buffer/line driver],
      [SN74AHCT125N Quadruple Buffer],
      [1],
      [\$0.80],

      [Stepper Motor],
      [3HS22-2804S NEMA 23],
      [2],
      [\$26.74],

      [Stepper Controller],
      [DM542TE Stepper Controller],
      [2],
      [\$42.00],

      [Ethernet Module],
      [W5500 Ethernet LAN Module],
      [1],
      [\$6.50],

      [E-Stop],
      [1NC 1NO Red Mushroom Emergency Stop],
      [1],
      [\$9.99],

      [Transformer],
      [ALITOVE Power Supply Adapter Converter Transformer],
      [1],
      [\$14.00],

      [Buck Converter],
      [LM2596 DC-DC Buck Converter],
      [1],
      [\$1.60],

      [Electromagnet],
      [Electromagnet Solenoid BM-P 80-38],
      [1],
      [\$44.98],

      [Proximity Laser Sensor],
      [VL53L0X ToF Sensor],
      [1],
      [\$2.98],

      [Shaft Coupler],
      [Shaft Coupler (6.35 x 8 mm)],
      [2],
      [\$11.99],

      [Limit Switch],
      [HiLetgo KW12-3 Micro Limit Switch],
      [1],
      [\$0.60],

      [Rail Guide],
      [MGN12H 300 mm Linear Rail Guide],
      [2],
      [\$35.99],

      [Lead Screw],
      [TR8x2 Lead Screw (300 mm)],
      [1],
      [\$11.99],

      [Bearings],
      [Pillow Block Bearing, 5/16 in (8 mm)],
      [4],
      [\$8.49],

      [Guide Rails],
      [Linear Rail Slide SBR20-800 mm],
      [2],
      [\$44.90],

      [Belt],
      [GT2 Timing Belt],
      [1],
      [\$16.88],

      [Aluminum Beams],
      [4040 T-Slot Extruded Aluminum Profile, 1000 mm],
      [4],
      [\$79.99],

      [Relay],
      [One-Channel Relay Module],
      [1],
      [\$3.70],

      [Buzzer],
      [Gikfun Passive Electronic Buzzer],
      [2],
      [\$1.80],

      [MOSFET Transistor],
      [IRLZ44N MOSFET Transistors],
      [4],
      [\$4.00],

      [Terminal Block],
      [Glarks Terminal Block Set],
      [2],
      [\$0.26],

      [Flyback Diode],
      [BOJACK 1N4007 Rectifier Diode],
      [1],
      [\$0.05],

      [Wires],
      [22 AWG Stranded Wire Spool],
      [1],
      [\$12.29],

      [Cable Wrap Insulation],
      [Eventronic Heat-Shrink Tubing 2:1],
      [1],
      [\$6.99],

      [Fuse Holder],
      [FEBRYTOLD 0-Gauge Inline Fuse Holder],
      [1],
      [\$4.25],

      [Resistor Kit],
      [Upvivi Resistor Assortment Kit],
      [1],
      [\$6.99],

      [T-Nuts],
      [4040 Series T-Sliding Nuts],
      [15],
      [\$9.99],

      [Bolt and Nut Kit],
      [M5 Button-Head Socket Cap Screw and Nut Kit],
      [1],
      [\$16.99],

      [Motor Mounting],
      [NEMA 23 Steel Mounting Bracket],
      [4],
      [\$11.99],

      [Nut Block],
      [Lysee Lead-Screw Nut Block],
      [2],
      [\$20.19],

      [Conveyor Belt],
      [12 V DC Electric Desktop Conveyor Belt],
      [1],
      [\$99.51],

      table.hline(stroke: 1pt),

      table.cell(colspan: 3, align: right)[
        *Total without conveyor belt (before tax)*
      ],
      [*\$525.94*],

      table.cell(colspan: 3, align: right)[
        *Total with conveyor belt (before tax)*
      ],
      [*\$625.45*],
    ),

    caption: [Project component budget],
  ) <table:project-budget>
]