// Subtract background signal:
run("Subtract Background...", "rolling=50 sliding disable");
run("Set Measurements...", "mean redirect=None decimal=3");
// Threshold the cell:
//run("Threshold...");
setThreshold(100, 65535, "raw");
//setTool("wand");
waitForUser("Outline Cell");
run("Measure");
String.copyResults();
waitForUser("Paste Results");
Table.deleteRows(0, 0);
close();