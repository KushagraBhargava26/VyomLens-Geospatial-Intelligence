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

## 📁 Repository Architecture

The project is strictly separated into a research environment and a production application:

```text
VyomLens/
├── training_environment/          # AI Research & Testing Sandbox
│   ├── main.ipynb                 # Data augmentation, training, and validation logic
│   └── satellite_resnet18_phase2.pth  # Local weights for quick Jupyter testing
│
└── satellite-app/                 # Production Web Application
    ├── uploads/                   # Temporary Multer storage for incoming telemetry
    ├── index.html                 # Frontend UI
    ├── style.css                  # Animations and theming
    ├── server.js                  # Node.js/Express traffic controller
    ├── model.py                   # Python inference script
    └── satellite_resnet18_phase2.pth  # Live production model weights
