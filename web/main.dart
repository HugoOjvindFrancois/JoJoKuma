import 'dart:async';
import 'dart:html' as html;
import 'package:stagexl/stagexl.dart';
import 'dart:math';
//import 'field.dart';

Future<Null> main() async {
  StageOptions options = new StageOptions()
    ..backgroundColor = Color.White
    ..antialias = true
    ..renderEngine = RenderEngine.WebGL;

  var canvas = html.querySelector('#stage');
  var stage = new Stage(canvas, width: 1280, height: 800, options: options);

  var renderLoop = new RenderLoop();
  renderLoop.addStage(stage);

  var resourceManager = new ResourceManager();
  resourceManager.addBitmapData("dart", "images/dart@1x.png");
  resourceManager.addBitmapData("field", "images/field.png");

  await resourceManager.load();

  var logoData = resourceManager.getBitmapData("dart");
  var logo = new Sprite();
  logo.addChild(new Bitmap(logoData));

  logo.pivotX = logoData.width / 2;
  logo.pivotY = logoData.height / 2;

  // Place it at top center.
  logo.x = 1280 / 2;
  logo.y = 0;

  //stage.addChild(logo);

  // And let it fall.
  var tween = stage.juggler.addTween(logo, 3, Transition.easeOutBounce);
  tween.animate.y.to(800 / 2);

  // Add some interaction on mouse click.
  Tween rotation;
  logo.onMouseClick.listen((MouseEvent e) {
    // Don't run more rotations at the same time.
    if (rotation != null) return;
    rotation = stage.juggler.addTween(logo, 0.5, Transition.easeInOutCubic);
    rotation.animate.rotation.by(2 * pi);
    rotation.onComplete = () => rotation = null;
  });
  logo.mouseCursor = MouseCursor.POINTER;

//  var field = new Shape();
//  field.graphics.beginPath();
//  field.graphics.decodePath('M 200 200 v -150 a 150 150 0 0 0 -150 150 z');
//  field.graphics.fillColor(Color.Yellow);
//  field.graphics.strokeColor(Color.SteelBlue, 4);
//  field.graphics.beginPath();
//  field.graphics.decodePath('M 230 230 h -150 a 150 150 0 1 0 150 -150 z');
//  field.graphics.fillColor(Color.LightCyan);
//  field.graphics.strokeColor(Color.SteelBlue, 4);
//  stage.addChild(field);

  var fieldData = resourceManager.getBitmapData("field");
  var field = new Sprite();
  field.addChild(new Bitmap(fieldData));

  field.pivotX = fieldData.width / 2;
  field.pivotY = fieldData.height / 2;

  // Place it at top center.
  field.x = 1280 / 2;
  field.y = 800 / 2;

  stage.addChild(field);

//  var anotherField = new Filed();
//  stage.addChild(anotherField);

  // See more examples:
  // https://github.com/bp74/StageXL_Samples
}
