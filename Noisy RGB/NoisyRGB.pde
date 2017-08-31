void setup() 
{
  size(720, 720);
  frameRate(60);  
}

float noiseScale = 50;
float noiseOffset = 0.0;
float noiseSpeed = 0.75;

void draw() 
{
  background(22,23,26);
  
  color [] colors = { 
    color(51,216,154), 
    color(99,116,199),
 	color(196,75,95), 
  };
  
  var halfWidth = width * 0.5;
  var halfHeight = height * 0.5;
  
  for(int l = 0; l < 3; ++l)
  {
    // draw spline setup
    noFill();
    stroke(colors[l]);
    strokeWeight(2);

    beginShape();
    for (int i = 0; i < width; i++){
      var dy = getNoiseY(i+noiseOffset + (9990*l));
      curveVertex(i, halfHeight + dy + l*20);
    }

    // end draw spline setup
    endShape();
    noStroke();

    // draw ellipse

    var ellipseY = getNoiseY(halfWidth+noiseOffset+ (9990*l))
    fill(colors[l]);
    stroke(colors[l]);
    ellipse(halfWidth, l*20 + halfHeight + ellipseY,20,20);
    strokeWeight(4);
    noFill();
    ellipse(halfWidth, l*20 + halfHeight+ ellipseY,35,35);
  }
  noiseOffset += noiseSpeed;
}

float getNoiseY(float x)
{
  	var noiseValue = noise(x/noiseScale*0.25);
    var yValue = noiseScale*8;
    var dy = map(noiseValue, 0, 1, -yValue, yValue);
    return dy;
}