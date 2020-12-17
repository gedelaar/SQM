module RascalModules::VolumeLoc

import lang::java::jdt::m3::Core;
import Set;
import ValueIO;
import IO;
import List;
import Map;
import Relation;
import util::Resources;
import util::Math;  // noodzakelijk voor de toString(totaal)

loc project = |project://smallsql|;


public set[loc] javaBestanden(loc project) {
   Resource r = getProject(project);
   return { a | /file(a) <- r, a.extension == "java" };
}

public bool aflopend(tuple[&a, num] x, tuple[&a, num] y) {
   return x[1] > y[1];
} 

public void volumeLoc() {
   set[loc] bestanden = javaBestanden(project);
   int totaal = 0;
  for (   a <- bestanden ){
  
   totaal = totaal + (size(readFileLines(a)));
   }
   println("Total lines of code: " + toString(totaal));
}


