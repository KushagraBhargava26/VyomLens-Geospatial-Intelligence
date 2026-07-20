# 🌍 VyomLens – Geospatial Intelligence

> AI-powered satellite image classification using **PyTorch**, **ResNet18**, **Node.js**, and **Express**.

![Python](https://img.shields.io/badge/Python-3.10+-blue?logo=python)
![PyTorch](https://img.shields.io/badge/PyTorch-Deep%20Learning-ee4c2c?logo=pytorch)
![Node.js](https://img.shields.io/badge/Node.js-Express-339933?logo=node.js)
![Docker](https://img.shields.io/badge/Docker-Containerized-2496ED?logo=docker)
![License](https://img.shields.io/badge/License-MIT-green)

---

## 📌 Overview

VyomLens is an AI-powered geospatial intelligence application that classifies satellite imagery into different land-use and land-cover categories using a fine-tuned **ResNet18** deep learning model.

The application combines a **Node.js (Express)** backend with a **Python-based PyTorch inference engine**, providing a seamless web interface where users can upload satellite images and receive real-time AI predictions.

---

## 🌐 Live Demo

🚀 **Try it here:**  
**https://vyomlens-geospatial-intelligence.onrender.com**

> **Note:** The application is hosted on Render's free tier. If the service has been idle, the first request may take **30–60 seconds** while the server wakes up.

---

## ✨ Features

- 🛰️ Satellite image classification
- 🤖 Deep Learning using ResNet18
- ⚡ Real-time inference
- 📊 Confidence score prediction
- 📤 Image upload support
- 🌐 Interactive web interface
- 🔗 Node.js + Python integration
- 🐳 Dockerized deployment
- ☁️ Hosted on Render

---

## 🗂️ Supported Classes

The model predicts the following land-cover categories:

- Annual Crop
- Forest
- Herbaceous Vegetation
- Highway
- Industrial
- Pasture
- Permanent Crop
- Residential
- River
- Sea/Lake

---

## 🏗️ System Architecture

```text
                User
                  │
                  ▼
          HTML/CSS Frontend
                  │
                  ▼
        Express.js Backend
                  │
      child_process.spawn()
                  │
                  ▼
       Python Inference Engine
                  │
      ResNet18 (.pth Model)
                  │
                  ▼
        JSON Prediction Result
                  │
                  ▼
              Web Browser
```

---

## 📁 Project Structure

```text
VyomLens-Geospatial-Intelligence/
│
├── satellite-app/
│   ├── uploads/
│   │   └── .gitkeep
│   │
│   ├── index.html
│   ├── style.css
│   ├── server.js
│   ├── model.py
│   ├── satellite_resnet18_phase2.pth
│   ├── package.json
│   ├── package-lock.json
│   └── .gitignore
│
├── Dockerfile
├── requirements.txt
├── .gitignore
└── README.md
```

---

## 🧠 AI Model

| Property | Value |
|----------|-------|
| Model | ResNet18 |
| Framework | PyTorch |
| Input Size | 224 × 224 |
| Output Classes | 10 |
| Model Format | `.pth` |

---

## 🛠️ Tech Stack

### Artificial Intelligence

- PyTorch
- TorchVision
- Pillow

### Backend

- Node.js
- Express.js
- Multer
- CORS
- Python

### Frontend

- HTML5
- CSS3
- JavaScript

### Deployment

- Docker
- Render

---

## 🚀 Getting Started

### Clone the Repository

```bash
git clone https://github.com/KushagraBhargava26/VyomLens-Geospatial-Intelligence.git

cd VyomLens-Geospatial-Intelligence
```

---

### Install Python Dependencies

```bash
pip install -r requirements.txt
```

---

### Install Node Dependencies

```bash
cd satellite-app
npm install
```

---

### Run the Application

```bash
npm start
```

Open your browser and visit:

```
http://localhost:7860
```

---

## 🐳 Docker

Build the Docker image:

```bash
docker build -t vyomlens .
```

Run the container:

```bash
docker run -p 7860:7860 vyomlens
```

---

## 🔄 Application Workflow

1. Upload a satellite image.
2. The Node.js server receives the image.
3. The image is temporarily stored.
4. Node.js invokes the Python inference script.
5. The PyTorch model predicts the land-cover class.
6. The prediction is returned as JSON.
7. The frontend displays the result and confidence score.

---

## 📊 Sample Prediction

```json
{
  "class": "Forest",
  "confidence": 0.9842
}
```

---

## 📸 Screenshots

> Screenshots and demo GIF will be added soon.

---

## 🚀 Future Enhancements

- Interactive map integration
- Batch image prediction
- Explainable AI (Grad-CAM)
- Model performance dashboard
- REST API documentation
- Confidence visualization
- Mobile-responsive UI improvements

---

## 👨‍💻 Author

**Kushagra Bhargava**

- GitHub: https://github.com/KushagraBhargava26
- Project: https://github.com/KushagraBhargava26/VyomLens-Geospatial-Intelligence

---

## ⭐ Support

If you found this project helpful or interesting, please consider giving it a **⭐ Star** on GitHub. Your support helps the project grow and motivates future improvements.