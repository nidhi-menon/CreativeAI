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
  size(800, 800);
  segments = new ArrayList<Segment>();
  PVector a = new PVector(200, 300);
  PVector g = new PVector(400, 300);
  PVector d = new PVector(600, 300);

  float len = PVector.dist(a, g);
  float ht = len * sqrt(3) / 2;
  
  PVector b = new PVector(300, 300-ht);
  PVector c = new PVector(500, 300-ht);
  PVector e = new PVector(500, 300+ht);
  PVector f = new PVector(300, 300+ht);
  
  Segment s1 = new Segment(a, b);
  Segment s2 = new Segment(b, c);
  Segment s3 = new Segment(c, d);
  Segment s4 = new Segment(d, e);
  Segment s5 = new Segment(e, f);
  Segment s6 = new Segment(f, a);
  
  Segment s7 = new Segment(a, c);
  Segment s8 = new Segment(c, a);
  Segment s9 = new Segment(c, e);
  Segment s10 = new Segment(e, c);
  Segment s11 = new Segment(a, e);
  Segment s12 = new Segment(e, a);
  
  Segment s13 = new Segment(b, d);
  Segment s14 = new Segment(d, b);
  Segment s15 = new Segment(d, f);
  Segment s16 = new Segment(f, d);
  Segment s17 = new Segment(b, f);
  Segment s18 = new Segment(f, b);
  
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
  segments.add(s13);
  segments.add(s14);
  segments.add(s15);
  segments.add(s16);
  segments.add(s17);
  segments.add(s18);
  //segments.add(s19);
  //segments.add(s20);
  //segments.add(s21);
  //segments.add(s22);
  //segments.add(s23);
  //segments.add(s24);

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
