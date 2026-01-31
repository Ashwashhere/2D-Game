# 2D Zombie Defender (Java)

**2D Zombie Defender** is a fast-paced, point-and-click survival game where you protect a central survivor from relentless waves of zombies. This project was developed to demonstrate core **Object-Oriented Programming (OOP)** principles, including inheritance, polymorphism, and dynamic data structure management in Java.

---

### 🎮 Gameplay Overview

The player is tasked with defending a "man" (the goal) located in the center of the screen. Zombies spawn at the edges and move toward the center; you must click them to eliminate them before they reach the survivor.

* **Progressive Difficulty:** Each level increases the number of enemies and their movement speed.
* **Health System:** You start with a set number of hearts. A collision between a zombie and the survivor results in a heart loss. The game ends when hearts reach zero.
* **Hazards:** Watch out for "Zombie Spit"—projectiles that move toward the survivor that must be intercepted.
* **Scoring:** Earn points for every zombie killed, with high scores saved to a local file for persistence.

---

### 🛠 Technical Features

This project explores the technical architecture of 2D game design using the Java ecosystem.

* **Polymorphic Enemy System:** Uses an `Enemies` base class with specialized subclasses (e.g., `Zombie`, `Crawler`) that inherit unique attributes and behaviors.
* **Custom Collision Detection:** Implements distance-based logic to detect mouse clicks on moving targets.
* **Dynamic Entity Management:** Utilizes an `ArrayList` to manage active enemies, allowing for efficient rendering and removal during gameplay.
* **File Handling:** Includes a file retrieval and writing system to track and display player high scores across sessions.
* **State Machine Logic:** Features distinct procedures for the **Start Screen**, **Gameplay**, and **End Screen** (Game Over).

---

### 💻 Code Snippet: Mouse Collision

The game uses a custom method to determine if a player has successfully clicked an enemy based on the distance between the mouse coordinates and the object's center.

```java
boolean mouseCollisionDetection() {
    int distanceX = (int) Math.abs(x - mouse_x);
    int distanceY = (int) Math.abs(y - mouse_y);
    
    // Check if the click falls within the 50x50 hit box
    if (distanceX < 50 && distanceY < 50) {
        return true;
    }
    return false;
}

```

---

### 🚀 Controls

* **Mouse Move:** Aim at incoming zombies.
* **Left Click:** Attack/Kill zombies and projectiles.
* **UI Navigation:** Navigate menus (Start/Restart) via mouse interaction.

---

### 📂 Project Structure

* **`Main.java`**: Handles the initial setup and the primary game loop (update/render).
* **`Classes/`**: Contains the enemy inheritance hierarchy and the player goal logic.
* **`Assets/`**: Manages external resources including animated backgrounds, survivor sprites, and explosion effects.
