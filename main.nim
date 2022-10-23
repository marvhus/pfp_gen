import system
import strformat
import math

type
  Color = tuple[r, g, b: float]
  Size = tuple[width, height: int]

const
  WIDTH = 1024
  HEIGHT = 1024

proc normal(n: float): float =
  (n + 1.0) * 0.5
  
proc frag(u, v: float): Color =
  let n = 3.0
  (
   sin(u * n / 1.7).normal,
   sin((u + v) * n + 1.2).normal,
   cos(v * n * 0.7).normal,
  )
  
proc make_ppm(file: string, size: Size): void =
  let f = open(file, fmWrite)
  defer: f.close()
  f.writeLine("P6")
  f.writeLine(fmt"{size.width} {size.height} 255")
  for y in 0..<size.height:
      for x in 0..<size.width:
        let
          u = x.float / WIDTH.float
          v = y.float / HEIGHT.float
        
        let (r, g, b) = frag(u, v)
        
        f.write(chr(int(r * 255.0)))
        f.write(chr(int(g * 255.0)))
        f.write(chr(int(b * 255.0)))
  
proc main(): void =
  make_ppm("ppm/banner.ppm", (width: 1024, height: 406))
  make_ppm("ppm/avatar.ppm", (width: 1024, height: 1024))

when isMainModule:
   main()
