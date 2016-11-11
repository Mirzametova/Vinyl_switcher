/**
 * Load and Display 
 * 
 * Images can be loaded and displayed to the screen at their actual size
 * or any other size. 
 */

PImage img;  // первое изображение
PImage nextimg; //изображение, которое придёт на смену первому

void setup() {
  size(1500, 1500);
  // The image file must be in the data folder of the current sketch 
  // to load successfully
  img = loadImage("pinkrainbow Mir.jpg");  // Load the image into the program  
  nextimg = loadImage("velvet nevermind MIr.jpg");
}

void draw() {
  background(0); 
  // Displays the image at its actual size at point (0,0)
  image(img, 0, 0);
  // Displays the image at point (0, height/2) at half of its size
 // image(img, 0, height/2, img.width/2, img.height/2);
}

void mousepressed() {
  if (mousePressed == true) {
    image(nextimg, 0, 0);
  }
  
}