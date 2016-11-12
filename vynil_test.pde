String dirPath="https://github.com/Mirzametova/vynil_test/tree/master/data/";
File dir = new File(dirPath);
Object[] list = dir.list();
String imageFile=dirPath+list[7];
//println(imageFile);

loadImage(imageFile);
