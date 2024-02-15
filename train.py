# import torch
from ultralytics import YOLO

# torch.cuda.set_device(0)
# device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')

# model = YOLO('yolov8s.pt').to(device)
model = YOLO('yolov8s.pt')
model.train(data='custom.yaml', device='cpu', epochs=200, batch=10, project='results')
model.export(format='torchscript', optimize=True)
