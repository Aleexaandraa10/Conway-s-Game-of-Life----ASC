# Conway's Game of Life - Implementare în Assembly x86

## 📖 Descriere
Acest proiect reprezintă o implementare a celebrului **Conway's Game of Life**, realizată în cadrul materiei **Arhitectura Sistemelor de Calcul**. Scopul proiectului a fost de a pune în practică concepte fundamentale legate de **procesarea paralelă, optimizarea performanței și manipularea memoriei** folosind limbajul Assembly.

Proiectul a fost împărțit în trei probleme distincte, iar eu am realizat **prima și a treia problemă**, acestea fiind strâns corelate între ele. **Prima problemă** a presupus crearea și rularea unui simulator pentru **Game of Life**, iar **a treia problemă** a adus îmbunătățiri și optimizări pe baza celei dintâi.

---

## 🚀 **Funcționalități implementate**
### ✅ **Problema 1: Implementarea de bază a Game of Life**
-  **Inițializarea unei grile** de dimensiune variabilă cu celule vii și moarte.
-  **Aplicarea regulilor de evoluție** pe baza stării vecinilor.
-  **Simularea mai multor generații** pentru a observa dinamica populației celulare.
-  **Afișarea în terminal** a grilei la fiecare pas de simulare.
-  **Citirea datelor de intrare** dintr-un fișier predefinit.

### ✅ **Problema 3: Optimizarea și Extinderea Simulării**
-  **Optimizări de performanță** prin utilizarea unor structuri de date eficiente.
-  **Implementarea unei versiuni optimizate** care reduce timpii de execuție.
-  **Folosirea de tehnici low-level pentru manipularea memoriei**, accelerând simularea.
-  **Explorarea paralelizării** pentru rularea mai rapidă a simulării pe mai multe nuclee.

---

## 🛠 **Tehnologii și concepte utilizate**
- **Programare de nivel jos** - Optimizarea accesului la memorie și reducerea latențelor.
- **Algoritmi pentru procesare matricială** - Aplicarea regulilor de tranziție pentru celule.
- **Structuri de date eficiente** - Stocarea și accesarea rapidă a grilei de simulare.

---

## 🔧 **Cum se rulează proiectul**
1. **Compilează codul folosind `gcc`:**
   ```sh
   gcc -o game_of_life problem1.c
   gcc -o game_of_life_opt problem3.c
   ```
2. **Rulează simularea:**
   ```sh
   ./game_of_life input.txt
   ./game_of_life_opt input.txt
   ```
3. **Observă evoluția celulelor în terminal.**


