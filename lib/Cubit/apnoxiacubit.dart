import 'dart:convert';
import 'dart:typed_data';
import 'package:apnoxia/Cubit/apnoxiastates.dart';
import 'package:apnoxia/Models/ecgsignal.dart';
import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;



class Apnoxiacubit extends Cubit<ApnoxiaState> {
  Apnoxiacubit() : super(Initial());

  ECGSignal? selectedSignal;


  Future<void> pickECGFile() async {
    try {
      emit(Loading());

      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['dat'],
      );

      if (result == null || result.files.isEmpty) {
        emit(LoadingSessionEnded());
        return;
      }

      final file = result.files.first;

      selectedSignal = ECGSignal(
        fileName: file.name,
        fileSize: file.size,
        filePath: file.path,
        fileBytes: file.bytes,
        samplesList: [], 
        totalSamples: 0,
        totalSegments: 0,
      );

      if (selectedSignal?.fileBytes != null) {
        selectedSignal = extractSignalSamples(selectedSignal!.fileBytes!);
      }

      final totalSamples = selectedSignal?.samplesList.length ?? 0;
      final totalSegments = (totalSamples / 6000).ceil();

      selectedSignal = selectedSignal?.copyWith(
        totalSamples: totalSamples,
        totalSegments: totalSegments,
      );

      emit(ApnoxiaECGUploaded(pickedSignal: selectedSignal!));

      print("\nSuccessfully selected signal file: ${selectedSignal!.fileName}");
      print("Extracted Samples length: ${selectedSignal!.samplesList.length} samples");
      print('Number of segments: ${selectedSignal!.samplesList.length / 6000}\n');
    }   
    
    catch (e) {
      emit(Error('Error selecting file: ${e.toString()}'));
    }
  }

  
   ECGSignal extractSignalSamples(Uint8List fileBytes) {
    List<int> extractedSamples = [];
    for (int i = 0; i < fileBytes.length - 1; i += 2) {
      int byte1 = fileBytes[i];
      int byte2 = fileBytes[i + 1];
      int sample = (byte2 << 8) | byte1;
      if (sample >= 32768) {
        sample -= 65536;
      }
      extractedSamples.add(sample);
    }
    return selectedSignal!.copyWith(samplesList: extractedSamples);
  }


  List<int> getSegmentSamples(int segmentID) {
    if (selectedSignal == null) return [];
    int start = segmentID * 6000;
    int end = start + 6000;
    if (end > selectedSignal!.samplesList.length) {
      end = selectedSignal!.samplesList.length;
    }
    print(selectedSignal!.samplesList.sublist(start, end));
    return selectedSignal!.samplesList.sublist(start, end);
  }


  Future<void> analyzeAndFetchECGData(int segmentID) async {
    try {
      emit(Loading());  

      List<int> segmentSamples = getSegmentSamples(segmentID);
      String segmentSamplesJson = jsonEncode({"segment_samples": segmentSamples});

      var uri = Uri.parse('http://127.0.0.1:5000/analyze');
      var response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: segmentSamplesJson,
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        emit(ECGDataFetched(
          apneaResults: responseData['result'], 
          chartPath: responseData['chart_url']
        ));
      } 
      else {
        emit(Error('Failed to analyze ECG data. Server responded with ${response.statusCode}.'));
      }
    } 
    
    catch (e) {
      emit(Error("Error analyzing ECG data: $e"));
    }
  }


}
