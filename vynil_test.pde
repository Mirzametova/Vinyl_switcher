PImage img;
String[] filenames;
int imgIndex = 0; //initial image index

void setup() {
  size(750, 750);
  //use sketchPath built-in variable 
  //to get system independent path to sketch
  String dirPath = sketchPath + "/data";
  filenames = listFileNames(dirPath);
  //println(filenames);
  img = loadImage(filenames[imgIndex]); //select initial image
}

void draw() {
//  for (int i = 0; i < filenames.length; i++) {
//    println(i);
//    img = loadImage(filenames[i]);
//  }
  
  image(img, 0, 0, 750, 750); 
  //draw image with its top-left corner aligned
  //with window's top-left corner, image scaled to 750×750
}

void mouseClicked() {
  if (mouseX < width/2 ) { // click left side of window
    imgIndex--; //decrease image index
  } else { // click right side of window
    imgIndex++; //increase image index
  }
  img = loadImage(filenames[imgIndex]); //reload image
}

// This function returns all the files in a directory as an array of Strings  
String[] listFileNames(String dir) {
  File file = new File(dir);
  if (file.isDirectory()) {
    String names[] = file.list();
    return names;
  } else {
    // If it's not a directory
    return null;
  }
}

