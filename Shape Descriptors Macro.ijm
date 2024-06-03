// This macro was used with 1K resolution .oir files with calibrated scales in the metadata.
// Set the measurements to "Shape Descriptors".
// Threshold the cell:
setThreshold("150", "65535", "black & white"); // Adjust these values according to your experiment.
//run("Threshold...");
waitForUser("Outline cell with wand or freehand tool")
// Threshold the puncta:
setAutoThreshold("Otsu dark no-reset"); // Another automatic threshold may be more appropriate for your experiment.
//run("Threshold...");
waitForUser("Adjust threshold")
// Very small particles return a high circularity and roundness, therefore we just measure larger puncta.
run("Despeckle"); // Optional: removes most small puncta.
run("Analyze Particles...", "size=1-Infinity display clear"); // Measurements are constrained to particles greater than 1 micron in area.
String.copyResults();
waitForUser("Record shape descriptors");