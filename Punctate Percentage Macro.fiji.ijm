// This macro was used with 1K resolution .oir files with a calibrated scale in the metadata.
// Threshold the cell:
run("Set Measurements...", "area integrated redirect=None decimal=3");
//run("Threshold...");
setThreshold(50, 65535, "raw"); // Adjust these values according to your experiment.
waitForUser("Outline cell with lasso or wand tool");
run("Measure");
String.copyResults();
waitForUser("Paste data into excel");
Table.deleteRows(0, 10000);
// Threshold the puncta:
setAutoThreshold("Otsu dark no-reset"); // Adjust the automatic threshold according to your experiment.
//run("Threshold...");
run("Analyze Particles...", "display clear slice");
String.copyResults();
waitForUser("Paste data into excel");
Table.deleteRows(0, 10000);
// To calculate the punctate percentage, divide the sum of the particle IntDen (line 15) by the cell IntDen (line 9).