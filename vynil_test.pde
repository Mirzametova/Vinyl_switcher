import com.leapmotion.leap.*;

Controller controller = new Controller();

GestureList gestures;
Gesture gesture;
SwipeGesture swipie;
Vector swipeDirection;
PImage img;
String[] filenames;
PImage[] images;
int imgIndex = 0; //initial image index
int imageCount;

int lastSwipeTime=0;

void setup() {
  size(750, 750);
  controller.enableGesture(Gesture.Type.TYPE_SWIPE);
  //use sketchPath built-in variable 
  //to get system independent path to sketch
  //String dirPath = sketchPath + "/data"; //for Processing 2
  String dirPath = dataPath("");
  filenames = listFileNames(dirPath);
  
  images=new PImage[filenames.length];
  
  imageCount = 0;
  
  for(int i = 0; i<filenames.length; i++){
    String filename = filenames[i];
    
    if(filename.contains(".jpg"))
    {      
      images[imageCount]=loadImage(filename);
      imageCount++;
    }
    
  }
  
  
  println(images);
  img = images[imgIndex]; //select initial image
  
}

void draw() {
  
  if(millis()-lastSwipeTime<400)
    return;
  
  //draw image with its top-left corner aligned
  //with window's top-left corner, image scaled to 750×750
  image(img, 0, 0, 750, 750);
  Frame frame = controller.frame();
  gestures = frame.gestures();
  

  
  for (int i = 0; i < gestures.count(); i = i+1) {
     gesture=gestures.get(i);
     
     if(gesture.type() != Gesture.Type.TYPE_SWIPE)
       continue;
     
     swipie=new SwipeGesture(gesture);
     //text( swipie.direction() + " direction", 50, 200 );
    swipeDirection = swipie.direction();
    
    if (swipeDirection.getX()>0){
    prev();
    }
    else {
    next();
    }
    println(lastSwipeTime+"lastSwipeTime");
    break;
  }
  
  
}

void prev()
{
    if (imgIndex == 0) {
      imgIndex = imageCount;
    }
    imgIndex--;
    img = images[imgIndex];
    lastSwipeTime = millis();
    println(imgIndex);
}

void next()
{
   if (imgIndex == (imageCount - 1)) {
      imgIndex = -1;
    }
    imgIndex++;
    img = images[imgIndex];
    lastSwipeTime = millis();
    println(imgIndex);
}

void mouseClicked() {
  if (mouseX < width/2) { 
    // click left side of window
    prev();
  } else { 
    // click right side of window
   next();
  }
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