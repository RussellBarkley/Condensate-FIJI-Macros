// This macro was used with 1K resolution .oir files with the scale calibrated in the metadata.
// Threshold a cell to measure its area:
run("Set Measurements...", "area redirect=None decimal=3"); // you may need to set the scale first.
setThreshold("48", "65535", "black & white"); // these values may need adjustment based on your images.
//run("Threshold...");
//setTool("wand");
waitForUser("Outline cell with wand or freehand tool")
run("Measure");
String.copyResults();
waitForUser("Record cell area");
Table.deleteRows(0, 1000);
// Threshold puncta to count and measure their area:
setAutoThreshold("Otsu dark no-reset"); // you may need to use another automatic threshold based on your samples.
//run("Threshold...");
run("Analyze Particles...", "display clear");
String.copyResults();
waitForUser("Record particle count and area");
Table.deleteRows(0, 1000);
// Divide the number of puncta by the area of the cell to calculate the droplet density.