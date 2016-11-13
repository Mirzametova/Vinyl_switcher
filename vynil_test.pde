import PImage;
String dirPath="/data/";
File dir = new File(dirPath);
Object[] list = dir.list();
String imageFile=dirPath+list[7];
//println(imageFile);

loadImage(imageFile);
