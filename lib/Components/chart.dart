import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatelessWidget {
  final List<int> segmentSamples;
  const Chart({super.key, required this.segmentSamples});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 330.h,
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: const Color(0xff7796ff).withOpacity(0.9),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: 50,
                width: 50,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black.withOpacity(0.1),
                ),
                child: Lottie.asset(
                  'assets/Animation - 1742951422892.json',
                  fit: BoxFit.fill,
                  repeat: true,
                  animate: true,
                ),
              ),
              Text(
                '  Segment Chart',
                style: GoogleFonts.workSans(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          ),

          SizedBox(height: 20.h),
          
          Expanded(
            child: SfCartesianChart(
              tooltipBehavior: TooltipBehavior(
                enable: true
              ),
              zoomPanBehavior: ZoomPanBehavior(
              enablePanning: true, 
              enablePinching: true, 
              enableDoubleTapZooming: true,
              enableMouseWheelZooming: true,
              enableSelectionZooming: true,
              zoomMode: ZoomMode.x, 
              //maximumZoomLevel: 10,
            ),
              primaryXAxis: NumericAxis(
                title: AxisTitle(text: 'Sample Index'),
                axisLine: AxisLine(width: 2),
                majorGridLines: MajorGridLines(width: 0.5),
                edgeLabelPlacement: EdgeLabelPlacement.shift,
                minimum: 0.0,
                maximum: segmentSamples.length.toDouble(),
                initialZoomFactor: 1.0,
                initialZoomPosition: 0.0,
                enableAutoIntervalOnZooming: true,
              ),
              primaryYAxis: NumericAxis(
                title: AxisTitle(text: 'Voltage (V)'),
                axisLine: AxisLine(width: 2),
                majorGridLines: MajorGridLines(width: 0.5),
                minimum: -400,
                maximum: 400,
              ),
              series: <LineSeries<int, int>>[
                LineSeries<int, int>(
                  name: 'ECG Data',
                  dataSource: segmentSamples,
                  xValueMapper: (int sample, index) => index,
                  yValueMapper: (int sample, index) => sample,
                  color: Colors.red.shade900,
                  width: 2,
                  enableTrackball: true,
                ),
              ],
            ),
          ),





        ],
      ),
    );
  }
}

