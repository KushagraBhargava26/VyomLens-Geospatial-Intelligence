import express from "express";
import multer from "multer";
import cors from "cors";
import path from "path";
import fs from "fs";
import { spawn } from "child_process";
import { fileURLToPath } from "url";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const app = express();
const port = process.env.PORT || 7860;

app.use(cors());
app.use(express.static(__dirname));

// Tell Multer to save user uploads into our 'uploads' folder
const upload = multer({ dest: "uploads/" });

// Serve the index.html when a user visits the site
app.get("/", (req, res) => {
  res.sendFile(path.join(__dirname, "index.html"));
});

// The core API route that the frontend talks to
app.post("/predict", upload.single("image"), (req, res) => {
  if (!req.file) {
    return res.status(400).json({ error: "No image file provided" });
  }

  // Get the location of the newly uploaded file
  const imagePath = req.file.path;

  // SPAN THE PYTHON PROCESS! This is where Node talks to Python
  const pythonCommand = process.env.PYTHON || (process.platform === "win32" ? "python" : "python3");

  const python = spawn(pythonCommand, ["model.py", imagePath]);

  let result = "";

  // Listen for the 'print(json.dumps())' from your model.py
  python.stdout.on("data", (data) => {
    result += data.toString();
  });

  // Catch any Python crashes
  python.stderr.on("data", (data) => {
    console.error("Python Error Stream:", data.toString());
  });

  // When Python finishes executing
  python.on("close", (code) => {
    // Housekeeping: delete the temporary image file to save hard drive space
    try {
      if (fs.existsSync(imagePath)) {
        fs.unlinkSync(imagePath);
      }
    } catch (err) {
      console.error("Error deleting temp file:", err);
    }

    // Process the final results
    if (code === 0) {
      try {
        const finalPrediction = JSON.parse(result);
        res.json(finalPrediction); // Send it back to the browser!
      } catch (e) {
        console.error("Failed to parse Python output. Raw output:", result);
        res.status(500).json({ error: "Invalid response from AI model" });
      }
    } else {
      res.status(500).json({ error: "Python prediction script failed" });
    }
  });
});

app.listen(port, "0.0.0.0", () => {
  console.log(`VyomLens Server running on http://localhost:${port}`);
  console.log(`System checks passed. Awaiting telemetry...`);
});
