﻿namespace RemObjects.Oxygene.Sugar;

interface

{$IFDEF NOUGAT}

{$ENDIF}

type

  {$IFDEF COOPER}
  Math = public class mapped to java.lang.Math
  {$ENDIF}
  {$IFDEF ECHOES}
  Math = public class mapped to System.Math
  {$ENDIF}
  {$IFDEF NOUGAT}
  Math = public class
  public
    const PI: Double = 3.1415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679;
    method pow(x, y: Double): Double;  
  {$ENDIF}
  end;

implementation

{$IFDEF NOUGAT}
method Math.pow(x, y: Double): Double;
begin
  
end;
{$ENDIF}

end.