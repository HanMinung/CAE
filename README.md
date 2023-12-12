# CAE mechanical design and analysis 

@ Handong global university

@ Mechanical and control engineering

@ subject : finite element method using ANSYS

@ semester : 2023 fall semester

@ author : Han Minwoong



​			This repository introduces the process and results of structural analysis of various machine shapes using finite element analysis. The tool used for finite element analysis is ansys (2023 version). I mainly analyzed the maximum stress and degree of deformation of the stress acting on machine elements. In addition, it deals with the fatigue analysis of the Goodman diagram and mainly deals with simulation of the resonance frequency measurement of the system based on the modal analysis method in simulation program. In addition, it contains experiments on strain gauge, combined stress, resonance frequency of multi story building, impact hammer test, etc. The experiments mainly involved comparing theoretical values, experimental values, and simulation values, and all relevant reports are included. Lastly, the final project deals with structural analysis issues regarding the maximum stress on the body frame and deflection of the motor connection of a d-made electric vehicle. Furthermore, we will look for improvements to the motor's fixed points, perform structural analysis on the improved model, and evaluate its performance.

* Most ansys files are attached with **.wbpz** extension.



## Contents

#### 1. LAB CONTENTS

* strain guage experiment : [click here to view](https://github.com/HanMinung/CAE/tree/main/1.%20LAB%20FILES/LAB1_strain_guage)
* combined stress experiment : [click here to view](https://github.com/HanMinung/CAE/tree/main/1.%20LAB%20FILES/LAB2_combined_stress)
* resonance frequency of multi-story building experiment : [click here to view](https://github.com/HanMinung/CAE/tree/main/1.%20LAB%20FILES/LAB3_building)
* impact hammer experiment : [click here to view](https://github.com/HanMinung/CAE/tree/main/1.%20LAB%20FILES/LAB4_impact_hammer)



### 2. Simulations

* stress concentration simulation of a shape with hole : [click here to view](https://github.com/HanMinung/CAE/tree/main/2.%20SIMULATIONS/assignment_1)
* fatigue analysis based on GOODMAN theory (fully reverse / zero based / ratio / historical) : [click here to view](https://github.com/HanMinung/CAE/tree/main/2.%20SIMULATIONS/assignment_2)

* structural analysis of gantry crane : [click here to view](https://github.com/HanMinung/CAE/tree/main/2.%20SIMULATIONS/assignment_3)

* structural analysis of overload protection device : [click here to view](https://github.com/HanMinung/CAE/tree/main/2.%20SIMULATIONS/assignment_4)

* structural analysis of coal compressor : [click here to view](https://github.com/HanMinung/CAE/tree/main/2.%20SIMULATIONS/assignment_5)
* thermal analysis of turbine blade (static / transient) : [click here to view](https://github.com/HanMinung/CAE/tree/main/2.%20SIMULATIONS/assignment_6)

* fluid analysis of a car (simple model) : [click here to view](https://github.com/HanMinung/CAE/tree/main/2.%20SIMULATIONS/assignment_7)

### 3. Final project

* project report (pdf) : [click here to view](https://github.com/HanMinung/CAE/blob/main/3.%20FINAL%20PROJECT/Final_project_report.pdf)

​			The final project aims to analyze the motor part of the self-made electric vehicle. Initially, the motor case had two-point contacts. And the motor shaft is connected with small chain sprocket, and that is connected with chain with 10mm pitch specification. The factors that I calculated to analyze the force exerted on the chain sprocket are as follows:

* Maximum rpm : 2600 [revolution per minute] --> angular velocity = 272.2 [rad/s]
* rated power : 7 [kW]
* Diameter of small sprocket : 69.12 [mm]

Following that, the force that I calculated which is exerted on the surface of the chain sprocket is about 1.0[kN]. This force has both horizontal and vertical component since chain has a horizontal angle. The problem in this contact condition is that with two point contact, the motor case has a horizontal rotation, so the connection between the chain and the sprocket gets weak where it is  a highly dangerous factor to operate the car. So, this project aims to improve the contact condition from two points to  three points contact condition. And to analyze the improved performance, the process of analyzing the deformation and the maximum stress and the fatigue analysis is introduced.

![image](https://github.com/HanMinung/CAE/assets/99113269/774c9766-a1f3-4524-951c-6a09e5877002)
