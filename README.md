# password_locking_system

🔒 Project Title:
Password Lock System Using Verilog HDL

📄 Project Description:
The Password Lock System is a digital security project implemented using Verilog Hardware Description Language (HDL). It is designed to restrict access to a system based on a predefined 4-bit password. The core functionality revolves around comparing user input with a preset password and responding accordingly.

When a user enters a password:

The system compares the input with the stored password using bitwise logic (XNOR).

If the password matches, access is granted.

If the password is incorrect, the system increments a failure counter.

After three incorrect attempts, the system activates an alarm signal, indicating a security breach.

A reset mechanism is also implemented to restore the system to its initial state when required.

The design is modular and consists of two main Verilog modules:

Top Module (password_lock_system.v) – Handles password comparison and interfaces with the counter.

Counter Module (password_attempt_counter.v) – Tracks the number of incorrect attempts and triggers the alarm after the threshold is reached.

A testbench (tb_password_lock_system.v) is used to simulate and validate the system’s behavior under different scenarios, such as correct password entry, multiple incorrect attempts, and reset conditions.

Additionally, the design is demonstrated with a working hardware prototype using an Arduino Uno, which emulates the Verilog logic with real input/output devices like a keypad and buzzer.

This project provides a practical example of secure access control logic and demonstrates how digital design principles can be applied to real-world authentication systems
