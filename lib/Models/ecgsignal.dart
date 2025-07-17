import 'dart:io';
import 'dart:typed_data';

class ECGSignal {
  final String fileName;
  final int fileSize;
  final String? filePath;
  final Uint8List? fileBytes;
  final List<int> samplesList;  
  final int? totalSamples;
  final int? totalSegments;
  final File? jsonFile;

  ECGSignal({
    required this.fileName,
    required this.fileSize,
    this.filePath,
    this.fileBytes,
    this.totalSamples,
    this.totalSegments,
    this.jsonFile, 
    required this.samplesList,
  });

  String getReadableSize() {
    if (fileSize < 1024) {
      return '$fileSize B';
    } 
    else if (fileSize < 1024 * 1024) {
      return '${(fileSize / 1024).toStringAsFixed(2)} KB';
    } 
    else {
      return '${(fileSize / (1024 * 1024)).toStringAsFixed(2)} MB';
    }
  }

  ECGSignal copyWith({
    String? fileName,
    int? fileSize,
    String? filePath,
    Uint8List? fileBytes,
    int? totalSamples,
    int? totalSegments,
    File? jsonFile,
    List<int>? samplesList,
  }) {
    return ECGSignal(
      fileName: fileName ?? this.fileName,
      fileSize: fileSize ?? this.fileSize,
      filePath: filePath ?? this.filePath,
      fileBytes: fileBytes ?? this.fileBytes,
      totalSamples: totalSamples ?? this.totalSamples,
      totalSegments: totalSegments ?? this.totalSegments,
      samplesList: samplesList ?? this.samplesList, 
      jsonFile: jsonFile ?? this.jsonFile,
    );
  }
}
