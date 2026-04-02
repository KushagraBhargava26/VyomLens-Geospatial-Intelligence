import sys
import json
import torch
import torch.nn as nn
from torchvision import models, transforms
from PIL import Image
import os
import warnings

# Suppress PyTorch warnings to keep the Node.js JSON parser happy
warnings.filterwarnings("ignore")

try:
    # 1. Setup Device & Classes
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    class_names = ['AnnualCrop', 'Forest', 'HerbaceousVegetation', 'Highway',
                   'Industrial', 'Pasture', 'PermanentCrop', 'Residential',
                   'River', 'SeaLake']

    # 2. Load Model Architecture
    resnet = models.resnet18(weights=None)
    in_features = resnet.fc.in_features
    resnet.fc = nn.Sequential(
        nn.Linear(in_features, 256),
        nn.ReLU(),
        nn.Dropout(0.3),
        nn.Linear(256, 10)
    )

    # 3. Load Model Weights (Make sure this file is in your folder!)
    model_path = os.path.join(os.path.dirname(__file__), 'satellite_resnet18_phase2.pth')
    resnet.load_state_dict(torch.load(model_path, map_location=device, weights_only=True))
    model = resnet.to(device)
    model.eval()

    # 4. Prepare Image Transforms
    test_transform = transforms.Compose([
        transforms.Resize((224, 224)),
        transforms.ToTensor(),
        transforms.Normalize(mean=[0.3444, 0.3803, 0.4078],
                             std=[0.2029, 0.1369, 0.1152])
    ])

    # 5. Grab the image path sent by Node.js
    if len(sys.argv) < 2:
        raise ValueError("No image path provided.")
    image_path = sys.argv[1]

    # 6. Run Inference
    img = Image.open(image_path).convert('RGB')
    img_tensor = test_transform(img).unsqueeze(0).to(device)

    with torch.no_grad():
        output = model(img_tensor)
        probs = torch.softmax(output, dim=1)[0]
        prediction = output.argmax(1).item()
        confidence = probs.max().item()

    # 7. Print ONLY the final JSON result
    result = {
        "class": class_names[prediction],
        "confidence": confidence
    }
    print(json.dumps(result))

except Exception as e:
    # Print error as JSON so Node can read it
    print(json.dumps({"error": str(e)}))