
//class Field extends DisplayObjectContainer {
//  final List<int> colors = [Color.Red, Color.Green, Color.Blue, Color.Brown];
//
//  Field() {
//    var background = new BitmapData(400, 300, false, Color.BlanchedAlmond);
//    var backgroundBitmap = new Bitmap(background);
//    addChild(backgroundBitmap);
//
//    for(var i = 0; i < colors.length; i++) {
//      var box = new BitmapData(100, 100, false, colors[i]);
//      var boxBitmap = new Bitmap(box);
//      boxBitmap.x = 80 + i * 50;
//      boxBitmap.y = 60 + i * 30;
//      addChild(boxBitmap);
//    }
//  }
//}