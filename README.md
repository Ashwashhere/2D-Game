2D Zombie Defender (Java)
A fast-paced, point-and-click survival game where you protect a central survivor from relentless waves of zombies. 
This project demonstrates core Object-Oriented Programming (OOP) principles, including inheritance, polymorphism, and dynamic data structure management in Java.

🎮 Gameplay Overview
The player is tasked with defending a "man" (the goal) located in the center of the screen. Zombies spawn and move toward the center;
you must click them to eliminate them before they reach the survivor.

Progressive Difficulty: Each level increases the number of enemies and their movement speed.
Health System: You start with a set number of hearts. A collision between a zombie and the survivor results in a heart loss. The game ends when hearts reach zero.
Hazards: Watch out for "Zombie Spit"—projectiles that move toward the player and must be avoided.
Scoring: Earn points for every zombie killed, with high scores saved to a local file for persistence.

🛠 Technical Features
This project was built to explore the technical structure of 2D game design using Java.
Polymorphic Enemy System: Uses an Enemies base class with specialized subclasses (e.g., Zombie, Crawler) that inherit unique attributes and behaviors.
Custom Collision Detection: Implements distance-based logic to detect mouse clicks on moving targets .
Dynamic Entity Management: Utilizes an ArrayList to manage active enemies, allowing for efficient rendering and removal during gameplay.
File Handling: Includes a file retrieval and writing system to track and display player high scores across sessions.
State Machine Logic: Features distinct procedures for the Start Screen, Gameplay, and End Screen (Game Over).

💻 Code Snippet: Mouse Collision
The game uses a custom method to determine if a player has successfully clicked an enemy:
Java

boolean mouseCollisionDetection() {
  int distanceX = int(abs(x - mouse_x));
  int distanceY = int(abs(y - mouse_y));
  if (distanceX < 50 && distanceY < 50) {
    return true;
  }
  return false;
}

🚀 Controls
Mouse Move: Aim at incoming zombies.
Left Click: Attack/Kill zombies.
UI: Navigate menus (Start/Restart) via mouse interaction.

📂 Project Structure
Main: Handles the setup and the primary draw loop.
Classes: Contains the enemy hierarchy and player goal logic.
Assets: Manages animated backgrounds, survivor animations, and explosion effects.
