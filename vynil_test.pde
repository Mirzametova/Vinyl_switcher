PImage img;
String[] filenames;
int imgIndex = 0; //initial image index

void setup() {
  size(750, 750);
  //use sketchPath built-in variable 
  //to get system independent path to sketch
  //String dirPath = sketchPath + "/data"; //for Processing 2
  String dirPath = dataPath("");
  filenames = listFileNames(dirPath);
  //println(filenames);
  img = loadImage(filenames[imgIndex]); //select initial image
}

void draw() {
  //draw image with its top-left corner aligned
  //with window's top-left corner, image scaled to 750×750
  image(img, 0, 0, 750, 750);
}

void mouseClicked() {
  if (mouseX < width/2) { // click left side of window
    //check if first file
    if (imgIndex == 0) {
      imgIndex = filenames.length;
    }
    imgIndex--; //decrease image index
  } else { // click right side of window
    //check if last file
    if (imgIndex == (filenames.length - 1)) {
      imgIndex = -1;
    }
    imgIndex++; //increase image index
  }
  //println(imgIndex);
  img = loadImage(filenames[imgIndex]); //reload image
}

// This function returns all the files in a directory as an array of Strings  
String[] listFileNames(String dir) {
  File file = new File(dir);
  if (file.isDirectory()) {
    String names[] = file.list();
    for (int i = 0; i < names.length; i++) {
      if (names[i].equals(".DS_Store") == true) { //check filenames
        String namesA[] = subset(names, 0, i); //select subset before DS_Store
        String namesB[] = subset(names, i+1); //select subset after DS_Store
        names = concat(namesA, namesB); //concatenate throwing away DS_Store
      }
    }
    return names;
  } else {
    // If it's not a directory
    return null;
  }
}