class Matrix {
  int a11;
  int a12;
  int a13;
  int a21;
  int a22;
  int a23;
  int a31;
  int a32;
  int a33;
  
  Matrix() {
    this.a11 = 1;
    this.a12 = 0;
    this.a13 = 0;
    this.a21 = 0;
    this.a22 = 1;
    this.a23 = 0;
    this.a31 = 0;
    this.a32 = 0;
    this.a33 = 1;
    // the identity matrix for the defautl constructor
  }
  
  Matrix(int a11, int a12, int a13, int a21, int a22, int a23, int a31, int a32, int a33) {
    this.a11 = a11;
    this.a12 = a12;
    this.a13 = a13;
    this.a21 = a21;
    this.a22 = a22;
    this.a23 = a23;
    this.a31 = a31;
    this.a32 = a32;
    this.a33 = a33;
  }
  
  
  Matrix multiply(Matrix B) {
    Matrix N = new Matrix();
    N.a11 = (a11*B.a11 + a12*B.a21 + a13*B.a31);
    N.a12 = (a11*B.a12 + a12*B.a22 + a13*B.a32);
    N.a13 = (a11*B.a13 + a12*B.a23 + a13*B.a33);
    
    N.a21 = (a21*B.a11 + a22*B.a21 + a23*B.a31);
    N.a22 = (a21*B.a12 + a22*B.a22 + a23*B.a32);
    N.a23 = (a21*B.a13 + a22*B.a23 + a23*B.a33);
    
    N.a31 = (a31*B.a11 + a32*B.a21 + a33*B.a31);
    N.a32 = (a31*B.a12 + a32*B.a22 + a33*B.a32);
    N.a33 = (a31*B.a13 + a32*B.a23 + a33*B.a33);
    
    return N;
  }
  
  PVector multiply(PVector v) {
    PVector r = new PVector();
    r.x = (a11*v.x + a12*v.y + a13*v.z);
    r.y = (a21*v.x + a22*v.y + a23*v.z);
    r.z = (a31*v.x + a32*v.y + a33*v.z);
    return r;
  }
  
  
  
  
}
