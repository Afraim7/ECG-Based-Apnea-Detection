import numpy as np
import json
import os
import matplotlib
import matplotlib.pyplot as plt
from scipy.signal import butter, filtfilt, iirnotch, lfilter
from flask import Flask, request, jsonify, send_from_directory
from flask_cors import CORS
matplotlib.use('Agg')
from keras.models import load_model

app = Flask(__name__)
CORS(app)

# Load model
model = load_model("ResNet_93_03_03_filter.keras")

# Directory for saving images
IMAGE_DIR = "static"
UPLOAD_DIR = "temp"
os.makedirs(UPLOAD_DIR, exist_ok=True)
os.makedirs(IMAGE_DIR, exist_ok=True)

# Constants
FS = 100  # Sampling rate (Hz)
SEGMENT_SIZE = 6000  # 60s segments at 100Hz
LOWCUT = 1  # Hz
HIGHCUT = 40  # Hz

def butter_bandpass(lowcut, highcut, fs, order=4):
    nyquist = 0.5 * fs
    low = lowcut / nyquist
    high = highcut / nyquist
    b, a = butter(order, [low, high], btype='band')
    return b, a

def apply_filter(data, lowcut, highcut, fs, order=4):
    b, a = butter_bandpass(lowcut, highcut, fs, order)
    return filtfilt(b, a, data)

def notch_filter(signal, fs, f0=50, Q=30):
    b, a = iirnotch(f0, Q, fs)
    return lfilter(b, a, signal)

def z_score_normalization(data):
    return (data - np.mean(data)) / np.std(data)

def preprocess_signal(data, lowcut, highcut, fs):
    data = notch_filter(data, fs)
    data = apply_filter(data, lowcut, highcut, fs)
    return z_score_normalization(data)

def convert_ecg_to_json(file_path):
    try:
        ecg_signal = np.fromfile(file_path, dtype=np.int16)
        return {"signal": ecg_signal.tolist()}
    except Exception as e:
        return {"error": str(e)}
 

@app.route('/analyze', methods=['POST'])
def analyze():
    try:
        data = request.get_json()
        segment_samples = data.get('segment_samples')

        if not segment_samples or not isinstance(segment_samples, list):
            return jsonify({"error": "A valid 'segment' list is required"}), 400

        signal = np.array(segment_samples, dtype=np.int16)
        processed_signal = preprocess_signal(signal, LOWCUT, HIGHCUT, FS)

        # Create the plot
        plt.figure(figsize=(12, 4))
        plt.plot(processed_signal, color='red', linewidth=0.5)
        plt.xlabel("Samples")
        plt.ylabel("Amplitude")

        # Save the chart
        chart_path = os.path.join(IMAGE_DIR, "ecgchart.png")
        plt.savefig(chart_path, bbox_inches='tight', dpi=100)
        plt.close()

        # Model prediction
        input_signal = processed_signal.reshape(1, -1, 1)
        pred = model.predict(input_signal, verbose=0)[0][0]
        result = "apnea" if pred > 0.5 else "normal"

        print(f"Segment length: {len(signal)}")
        print(f"Model prediction score: {pred}")

        # Return the chart URL and result
        return jsonify({
            "chart_url": "/static/ecgchart.png",
            "result": result
        }), 200

    except Exception as e:
        print("Error during analysis:", e)
        return jsonify({"error": "Failed to analyze the signal."}), 500




@app.route('/static/<path:filename>')
def serve_static(filename):
    try:
        return send_from_directory(IMAGE_DIR, filename)
    except FileNotFoundError:
        return jsonify({"error": "Chart not found"}), 404

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)

