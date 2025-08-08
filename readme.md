---

# AddKnit – Usage Instructions

## Overview

The code is located in the folder:
`AddKnit_Source`

Run the file **`MAIN.m`** from MATLAB.
At the beginning, you will be prompted to select a mesh file.

Mesh files are located in the folder:
`AddKnit_Data`

Test surfaces such as *hemisphere*, *pyramid*, *truncated pyramid*, etc., are located in the subfolder:
`AddKnit_Data_TESTFLAECHEN`

External libraries and functions required for the computation are located in:
`AddKnit_Extras`

If no file is selected, **MAIN** will terminate immediately.

After choosing a mesh file, it will be displayed in a **3D view**, and you can start marking points.

---

## Marking Order

The marking must be done in the following order:

1. **Start of the knit**
2. **End of the knit**
3. **Seam** *(optional)*
4. **Center line**

For a valid definition of the lines, you must at least define:

* Start
* End
* Center line

---

## GUI Controls

### Navigation

* **Rotate:** Right-click and hold
* **Zoom:** Mouse scroll
* **Pan:** Middle-click and hold

### Point Selection

* **Select point:** Left-click
* **Remove point:** Left-click again on the same point

When two points are clicked, a red line is calculated and displayed between them.
This line either:

* Follows mesh edges (shortest path calculated via **Dijkstra’s algorithm**)
* Represents the **geodesic distance** between the two points

**Algorithm Switching:**

* At GUI start, Dijkstra’s algorithm is active
* Press **`s`** → Switch to geodesic distance
* Press **`b`** → Switch back to Dijkstra
* You can switch between algorithms at any time

**Line Editing:**

* **Double left-click:** Closes a line, creating a closed curve
* **`n`** → Finish the construction of the current line
  *(After this, the line cannot be changed. Lines change from red = active to blue = finalized)*

**Special for Center Line:**

* Before constructing the center line, press **`m`**
* Construct points **from the start line to the end line**
* The center line must be created last

**Exit GUI:**

* **`q`** → Exit GUI, embed defined points into the mesh, and update the mesh

---

## After GUI Exit

After the GUI is closed, the algorithm runs automatically.
Results are stored in:
`AddKnit_Results`

The output consists of:

* A `.jac` file
* A `.bmp` file

**File naming format:**

```
[Mesh name]_[Creation date]_[Knitting technique].[jac or bmp]
```

**Example:**

```
Halbkugel_D20_03-Nov-2021_RR.bmp
Halbkugel_D20_03-Nov-2021_RR.jac
```

---

## Knitting Techniques

Currently available knitting techniques:

* `RR` – right-right
* `RL` – right-left
* `HS` – half-tube
* `IP` – Italian patent
* `HS2` – half-tube variant

Changing the knitting technique must be done manually in **`MAIN.m`**.
At the beginning of MAIN, stitch widths and heights are defined for all techniques (measured after washing and ironing).
For more details, contact **Uwe Röder**.

**Example:**

```matlab
W = [0.96, 0.88, 0.84, 0.76, 10/6];
H = [0.42, 0.3, 0.85, 0.44, 10/13];
KNIT_STR = {'RR', 'HS', 'IP', 'RL', 'HS2'};
KNIT = 5; % Change knitting technique here
```

---

