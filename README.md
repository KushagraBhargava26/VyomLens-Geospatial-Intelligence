---
title: VyomLens
emoji: 🛰️
colorFrom: blue
colorTo: indigo
sdk: docker
app_port: 7860
---

# 🛰️ VyomLens: Geospatial Intelligence Engine

![PyTorch](https://img.shields.io/badge/PyTorch-%23EE4C2C.svg?style=for-the-badge&logo=PyTorch&logoColor=white)
![NodeJS](https://img.shields.io/badge/node.js-6DA55F?style=for-the-badge&logo=node.js&logoColor=white)
![Express.js](https://img.shields.io/badge/express.js-%23404d59.svg?style=for-the-badge&logo=express&logoColor=%2361DAFB)
![HTML5](https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/css3-%231572B6.svg?style=for-the-badge&logo=css3&logoColor=white)

VyomLens is a full-stack deep learning application designed to autonomously classify high-resolution satellite imagery. By bridging a robust Node.js backend with a headless PyTorch neural network, VyomLens provides real-time geospatial intelligence through a modern, aerospace-themed dashboard.

> **View Live Demo / Screenshots:** > <img width="1919" height="871" alt="image" src="https://github.com/user-attachments/assets/5ce2b7c2-3842-4f2c-9d58-4c64cb69bc1c" />
<img width="1919" height="867" alt="image" src="https://github.com/user-attachments/assets/21531e69-9266-4f85-be1d-4dbdaab6e2ec" />
<img width="1919" height="866" alt="image" src="https://github.com/user-attachments/assets/5e4dee16-5f25-49f7-b8b7-faa64a54fdc1" />



---

## 🌟 Key Features

* **Deep Learning AI:** Powered by a ResNet18 Convolutional Neural Network (CNN) fine-tuned via transfer learning to achieve high accuracy on complex terrain identification.
* **10-Class Topography Detection:** Capable of classifying lands into: `Annual Crop`, `Forest`, `Herbaceous Vegetation`, `Highway`, `Industrial`, `Pasture`, `Permanent Crop`, `Residential`, `River`, and `Sea/Lake`.
* **Cross-Language Micro-Architecture:** An Express.js server natively communicates with a headless Python process (`child_process.spawn`) for seamless inference without requiring a heavy Python web framework like Flask or Django.
* **Mission-Control UI:** A responsive, dark-mode dashboard featuring drag-and-drop uploads, simulated radar-scanning CSS animations, and dynamic confidence interval visualizations.

---

## 📁 Project Structure

```text
VyomLens-Geospatial-Intelligence/
│
├── satellite-app/
│   ├── uploads/
│   │   └── .gitkeep                 # Stores uploaded images temporarily
│   │
│   ├── index.html                   # Frontend interface
│   ├── style.css                    # Styling
│   ├── server.js                    # Express.js backend server
│   ├── model.py                     # PyTorch inference script
│   ├── satellite_resnet18_phase2.pth# Trained ResNet18 model
│   ├── package.json                 # Node.js dependencies
│   ├── package-lock.json
│   └── .gitignore
│
├── Dockerfile                       # Docker configuration
├── requirements.txt                 # Python dependencies
├── .gitignore                       # Git ignore rules
└── README.md                        # Project documentation
```