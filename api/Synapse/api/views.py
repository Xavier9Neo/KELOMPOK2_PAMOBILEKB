import json
import os
from PIL import Image
import numpy as np
import tensorflow as tf
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from api.model.inference import Model
import cv2

model = Model.from_path('api/model/garden/animal_classifier.h5')

@csrf_exempt
def predict(request):
    if request.method == 'POST':
        try:
            data = json.loads(request.body.decode('utf-8'))
            user_data = data.get('data')

            if user_data is None:
                return JsonResponse({'error': 'No data provided'}, status=400)
            
            prediction = model.predict_from_data(user_data)

            return JsonResponse({'message': 'Data received', 'prediction': prediction}, status=200)
        except json.JSONDecodeError:
            return JsonResponse({'error': 'Invalid JSON format'}, status=400)
    else:
        return JsonResponse({'error': 'This endpoint only supports POST requests.'}, status=405)
    
@csrf_exempt
def predict_image(request):
    if request.method == 'POST':
        try:
            # Ambil file gambar dari request
            image_file = request.FILES.get('image')  # Sesuaikan dengan nama key dari Flutter/Postman
            if image_file is None:
                return JsonResponse({'error': 'No image provided'}, status=400)

            # Simpan gambar sementara
            temp_path = f"/tmp/{image_file.name}"
            with open(temp_path, 'wb') as temp_file:
                for chunk in image_file.chunks():
                    temp_file.write(chunk)

            # Buka dan preproses gambar
            img = Image.open(temp_path).convert('RGB')  # Buka gambar dan ubah ke RGB
            img = img.resize((224, 224))  # Resize sesuai kebutuhan model Anda (misalnya 224x224)
            img_array = np.array(img) / 255.0  # Normalisasi jika model membutuhkan
            img_array = np.expand_dims(img_array, axis=0)  # Tambahkan dimensi batch

            # Lakukan prediksi
            prediction = model.predict(img_array)
            predicted_class = np.argmax(prediction, axis=1)[0]  # Ambil kelas prediksi

            # Hapus file sementara
            os.remove(temp_path)

            # Kembalikan hasil prediksi
            return JsonResponse({
                "message": "Image received",
                "prediction": int(predicted_class),  # Convert hasil ke format JSON-friendly
                "confidence": float(np.max(prediction))  # Confidence score
            }, status=200)

        except Exception as e:
            # Tangani error jika ada
            print("Error occurred:", str(e))
            return JsonResponse({'error': f'An error occurred: {str(e)}'}, status=500)

    else:
        # Method selain POST tidak didukung
        return JsonResponse({'error': 'This endpoint only supports POST requests.'}, status=405)