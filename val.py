from ultralytics import YOLO

model = YOLO('./results/train/weights/best.pt')
results = model.val(project='results')
print(results.box.map50)
