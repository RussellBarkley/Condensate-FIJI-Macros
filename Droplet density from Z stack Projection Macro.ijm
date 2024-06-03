// First, set measurements to Area.
run("Z Project...", "projection=[Max Intensity]");
setThreshold("48", "65535", "black & white"); // Adjust minimum value to threshold the cell.
//run("Threshold...");
waitForUser("Outline cell with wand or freehand tool")
run("Measure");
waitForUser("Record cell area");
setAutoThreshold("Otsu dark no-reset"); // I used Otsu, but other automatic thresholds might be better for your experiment.
//run("Threshold...");
run("Analyze Particles...", "display clear");
waitForUser("Record particle count and area");
// I pasted the results into excel and found the number of condensates by usuing =max() on the data from line 10.
// I then divided the number of condensates in the cell (line 10) by the cell area (line 5) to get the droplet density.
// If there are multiple cells in a field, just close the projection and restart the macro on the Z stack image.