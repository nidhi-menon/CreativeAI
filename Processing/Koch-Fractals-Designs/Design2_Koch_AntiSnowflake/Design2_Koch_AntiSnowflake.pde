// Coding Challenge 129: Koch Snowflake
// Daniel Shiffman
// https://thecodingtrain.com/CodingChallenges/129-koch-snowflake.html
// https://youtu.be/X8bXDKqMsXE
// https://editor.p5js.org/codingtrain/sketches/SJHcVCAgN

ArrayList<Segment> segments;

void addAll(Segment[] arr, ArrayList<Segment> list) {
  for (Segment s : arr) {
    list.add(s);
  }
}

void setup() {
  size(1400, 800);
  segments = new ArrayList<Segment>();
  PVector a = new PVector(100, 300);
  PVector g = new PVector(550, 300);
  PVector d = new PVector(1000, 300);

  float len = PVector.dist(a, g);
  float h = len * sqrt(3) / 2;
  PVector b = new PVector(325, 300-h);
  PVector c = new PVector(775, 300-h);
  PVector e = new PVector(775, 300+h);
  PVector f = new PVector(325, 300+h);
  
  Segment s1 = new Segment(a, b);
  Segment s2 = new Segment(b, c);
  Segment s3 = new Segment(c, d);
  Segment s4 = new Segment(d, e);
  Segment s5 = new Segment(e, f);
  Segment s6 = new Segment(f, a);
  Segment s7 = new Segment(a, g);
  Segment s8 = new Segment(b, g);
  Segment s9 = new Segment(c, g);
  Segment s10 = new Segment(d, g);
  Segment s11 = new Segment(e, g);
  Segment s12 = new Segment(f, g);

  segments.add(s1);
  segments.add(s2);
  segments.add(s3);
  segments.add(s4);
  segments.add(s5);
  segments.add(s6);
  segments.add(s7);
  segments.add(s8);
  segments.add(s9);
  segments.add(s10);
  segments.add(s11);
  segments.add(s12);

  //println(children);
}

void mousePressed() {
  ArrayList<Segment> nextGeneration = new ArrayList<Segment>();

  for (Segment s : segments) {
    Segment[] children = s.generate();
    addAll(children, nextGeneration);
  }
  segments = nextGeneration;
}


void draw() {
  background(0);
  translate(0, 100);

  stroke(255);
  for (Segment s : segments) {
    s.show();
  }
}
