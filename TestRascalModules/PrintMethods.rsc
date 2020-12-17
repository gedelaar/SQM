module TestRascalModules::PrintMethods

import lang::java::jdt::m3::Core;
import Set;
import ValueIO;
import IO;
import List;
import Map;
import Relation;
import util::Resources;
import util::Math;

loc bestand1 = |file:///Users/Shared/bestand1.txt|;
loc bestand2 = |file:///Users/Shared/bestand2.txt|;
loc project = |project://smallsql|;
   M3 model = createM3FromEclipseProject(project);


public set[loc] javaBestanden(loc project) {
   Resource r = getProject(project);
   return { a | /file(a) <- r, a.extension == "java" };
}

public bool aflopend(tuple[&a, num] x, tuple[&a, num] y) {
   return x[1] > y[1];
} 

public void exercise9() {
 //  loc project = |project://JabberPoint/|;
   set[loc] bestanden = javaBestanden(project);
   // aantal regels per Java-bestand
   //map[loc, int] regels = ( a:size(readFileLines(a)) | a <- bestanden );
   int totaal = 0;
  for (   a <- bestanden ){
  
   totaal = totaal + (size(readFileLines(a)));
   }
   println("Total lines of code: " + toString(totaal));
}


public void printMethods1(loc projectbestand) 
      
{

M3 model = createM3FromEclipseProject(project);
writeTextValueFile(bestand1, "");

for (loc l <- methods(model)) {
 str s = readFile(l);
 appendToFile(bestand1,"=== <l> ===\n<s>");
}
}
 
  
public void printMethods2(loc projectbestand) {
M3 model = createM3FromEclipseProject(project);
 writeTextValueFile(bestand2, "");
str s = "" ;
for (loc l <- methods(model)) {
 s = s + readFile(l);
}
writeTextValueFile(bestand2, s);
}


