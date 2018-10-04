float radius;
float distance;

float x;
float y;

int inside = 0;
int all = 0;

float approx_PI = 0.0;
float best_PI = 0.0;

void setup() {
  size(400, 400);
  background(255);
  
  radius = width / 2;
  
  strokeWeight(2);
  ellipse(width / 2, height / 2, 2 * radius, 2 * radius);
  
  strokeWeight(1);
}

void draw() {
  for (int i = 0; i < 100; i++) {
    // setting random coordinated for the point
    x = random(width + 1);
    y = random(height + 1);
  
    // calculating distance from center of of the cirlle to the point
    distance = sqrt((x - width / 2) * (x - width / 2) + (y - height / 2) * (y - height / 2)); 
    
    if (distance <= radius) { // if the point is inside the circle
      stroke(0, 255, 0);      // then it's green
      inside++;
    }
    else {                    // if the point is outside the circle
      stroke(255, 0, 0);      // then it's red
    }
    all++;
    
    point(x ,y);
    
    approx_PI = 4.0 * ((float)inside / (float)all); // calculating approximate value of Pi
  
    // if new approximate value gets closer to the value of Pi, then print it and replace previous best_PI with it
    if ( abs((float)(approx_PI - Math.PI)) < abs((float)(best_PI - Math.PI)) ) {
      best_PI = approx_PI;
      println(best_PI);
    }
  }  
}
