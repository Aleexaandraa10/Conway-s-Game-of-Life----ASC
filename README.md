# **Conway's Game of Life - x86 Assembly Implementation**  

## 📖 **Description**  
This project is an implementation of the famous **Conway’s Game of Life**, developed as part of the **Computer Architecture** course. The goal was to apply fundamental concepts related to **parallel processing, performance optimization, and memory manipulation** using Assembly language.  

The project was divided into three distinct problems, and I implemented **Problem 1 and Problem 3**, which are closely related. **Problem 1** involved creating and running a **Game of Life simulator**, while **Problem 3** focused on improving and optimizing the initial implementation.  

---

## 🚀 **Implemented Features**  
### ✅ **Problem 1: Basic Game of Life Implementation**  
- **Initializing a grid** of variable size with live and dead cells.  
- **Applying evolution rules** based on the state of neighboring cells.  
- **Simulating multiple generations** to observe cellular population dynamics.  
- **Displaying the grid in the terminal** at each simulation step.  
- **Reading input data** from a predefined file.  

### ✅ **Problem 3: Optimization & Simulation Enhancements**  
- **Performance optimizations** using efficient data structures.  
- **Implementing an optimized version** that reduces execution time.  
- **Using low-level memory manipulation techniques** to speed up the simulation.  
- **Exploring parallelization** to run the simulation faster on multiple cores.  

---

## 🛠 **Technologies & Concepts Used**  
- **Low-level programming** - Optimizing memory access and reducing latency.  
- **Matrix processing algorithms** - Applying transition rules to cells.  
- **Efficient data structures** - Fast storage and retrieval of simulation grids.  

---

## 🔧 **How to Run the Project**  
1. **Compile the code using `gcc`:**  
   ```sh
   gcc -o game_of_life problem1.c
   gcc -o game_of_life_opt problem3.c
   ```  
2. **Run the simulation:**  
   ```sh
   ./game_of_life input.txt
   ./game_of_life_opt input.txt
   ```  
3. **Observe the evolution of cells in the terminal.**  
