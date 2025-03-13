import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() async {
  runApp(CoalConsumptionApp());
}

class CoalConsumptionApp extends StatelessWidget {
  const CoalConsumptionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CoalConsumptionChart(),
        ),
      ),
    );
  }
}

class CoalConsumptionChart extends StatefulWidget {
  const CoalConsumptionChart({super.key});

  @override
  State<CoalConsumptionChart> createState() => _CoalConsumptionChartState();
}

class _CoalConsumptionChartState extends State<CoalConsumptionChart> {
  late double asiaPacific;
  late double restOfWorld;
  late double northAmerica;
  late double europe;
  late List<CoalConsumptionData> coalConsumptionData;

  @override
  void initState() {
    coalConsumptionData = [
      CoalConsumptionData('1965', 10, 14, 12, 22),
      CoalConsumptionData('1966', 11, 14, 13, 21),
      CoalConsumptionData('1967', 10, 15, 13, 20),
      CoalConsumptionData('1968', 10, 14, 13, 21),
      CoalConsumptionData('1969', 12, 15, 13, 21),
      CoalConsumptionData('1970', 13, 15, 13, 21),
      CoalConsumptionData('1971', 14, 15, 12, 20),
      CoalConsumptionData('1972', 15, 15, 13, 19),
      CoalConsumptionData('1973', 15, 16, 14, 19),
      CoalConsumptionData('1974', 15, 16, 13, 19),
      CoalConsumptionData('1975', 16, 16, 13, 19),
      CoalConsumptionData('1976', 17, 16, 14, 20),
      CoalConsumptionData('1977', 18, 17, 15, 20),
      CoalConsumptionData('1978', 19, 17, 15, 20),
      CoalConsumptionData('1979', 20, 17, 16, 21),
      CoalConsumptionData('1980', 21, 17, 16, 21),
      CoalConsumptionData('1981', 22, 17, 17, 21),
      CoalConsumptionData('1982', 22, 17, 16, 21),
      CoalConsumptionData('1983', 24, 17, 17, 21),
      CoalConsumptionData('1984', 26, 18, 18, 21),
      CoalConsumptionData('1985', 28, 14, 19, 26),
      CoalConsumptionData('1986', 29, 14, 18, 26),
      CoalConsumptionData('1987', 31, 15, 19, 26),
      CoalConsumptionData('1988', 33, 15, 20, 26),
      CoalConsumptionData('1989', 34, 14, 20, 25),
      CoalConsumptionData('1990', 35, 14, 20, 24),
      CoalConsumptionData('1991', 37, 13, 20, 23),
      CoalConsumptionData('1992', 38, 12, 20, 21),
      CoalConsumptionData('1993', 40, 12, 21, 20),
      CoalConsumptionData('1994', 42, 11, 21, 19),
      CoalConsumptionData('1995', 43, 11, 21, 19),
      CoalConsumptionData('1996', 45, 11, 22, 18),
      CoalConsumptionData('1997', 45, 10, 23, 18),
      CoalConsumptionData('1998', 45, 10, 23, 17),
      CoalConsumptionData('1999', 46, 10, 23, 16),
      CoalConsumptionData('2000', 48, 10, 24, 17),
      CoalConsumptionData('2001', 50, 10, 24, 16),
      CoalConsumptionData('2002', 54, 10, 24, 16),
      CoalConsumptionData('2003', 62, 10, 24, 17),
      CoalConsumptionData('2004', 70, 11, 24, 17),
      CoalConsumptionData('2005', 79, 10, 25, 16),
      CoalConsumptionData('2006', 85, 11, 24, 17),
      CoalConsumptionData('2007', 92, 11, 25, 17),
      CoalConsumptionData('2008', 95, 12, 24, 16),
      CoalConsumptionData('2009', 98, 11, 21, 15),
      CoalConsumptionData('2010', 102, 11, 22, 15),
      CoalConsumptionData('2011', 110, 11, 21, 16),
      CoalConsumptionData('2012', 112, 12, 19, 16),
      CoalConsumptionData('2013', 114, 11, 19, 16),
      CoalConsumptionData('2014', 116, 12, 19, 15),
      CoalConsumptionData('2015', 115, 11, 17, 14),
      CoalConsumptionData('2016', 113, 11, 16, 14),
      CoalConsumptionData('2017', 116, 11, 15, 13),
      CoalConsumptionData('2018', 119, 11, 15, 13),
      CoalConsumptionData('2019', 122, 11, 12, 11),
      CoalConsumptionData('2020', 122, 11, 10, 10),
      CoalConsumptionData('2021', 128, 11, 11, 10),
      CoalConsumptionData('2022', 130, 11, 11, 10),
      CoalConsumptionData('2023', 136, 11, 9, 8),
    ];

    asiaPacific = _calculateSum((CoalConsumptionData coal) => coal.asiaPacific);
    restOfWorld = _calculateSum((CoalConsumptionData coal) => coal.restOfWorld);
    northAmerica =
        _calculateSum((CoalConsumptionData coal) => coal.northAmerica);
    europe = _calculateSum((CoalConsumptionData coal) => coal.europe);

    super.initState();
  }

  double _calculateSum(double Function(CoalConsumptionData) selector) =>
      coalConsumptionData.fold(0, (sum, coal) => sum + selector(coal));

  CategoryAxis _createCategoryAxis() {
    return CategoryAxis(
      interval: 3,
      title: const AxisTitle(
          text: 'Years',
          textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      labelPlacement: LabelPlacement.onTicks,
      majorGridLines: const MajorGridLines(width: 0),
      axisLine: AxisLine(width: 1.5, color: Colors.black),
      majorTickLines: MajorTickLines(color: Colors.black),
      labelStyle: TextStyle(fontWeight: FontWeight.w500),
      axisLabelFormatter: (AxisLabelRenderDetails details) {
        // Extract year and format
        final yearIndex = details.value.toInt(); // Get the index
        final coalData = coalConsumptionData;
        final year = coalData[yearIndex].year; // Map the index to the year

        // Check if the year is divisible by 10
        final isDivisibleBy10 =
            int.tryParse(year) != null && int.parse(year) % 10 == 0;

        return ChartAxisLabel(
          isDivisibleBy10
              ? year
              : ((year == '1965' || year == '2022')
                  ? year
                  : year.substring(year.length - 2)),
          details.textStyle,
        );
      },
    );
  }

  NumericAxis _createNumericAxis() {
    return NumericAxis(
      interval: 20,
      majorGridLines: const MajorGridLines(width: 0),
      axisLine: AxisLine(width: 1.5, color: Colors.black),
      majorTickLines: MajorTickLines(color: Colors.black),
      labelStyle: TextStyle(fontWeight: FontWeight.w500),
      title: const AxisTitle(
          text: 'Exajoules',
          textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(
          text: 'Global Coal Consumption Trends',
          textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      primaryXAxis: _createCategoryAxis(),
      primaryYAxis: _createNumericAxis(),
      series: _buildStackedAreaSeries(),
      annotations: _createAnnotations(),
    );
  }

  List<CartesianChartAnnotation> _createAnnotations() {
    TextStyle textStyle = TextStyle(
        fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white);
    return <CartesianChartAnnotation>[
      _createAnnotation(
          SizedBox(
            width: 100,
            height: 100,
            child: SfCircularChart(
              series: <CircularSeries>[
                DoughnutSeries<ChartData, String>(
                  dataSource: [
                    ChartData('Example', 40, Colors.black54),
                    ChartData('Example', 25, Colors.red.withValues(alpha: 0.7)),
                  ],
                  xValueMapper: (ChartData data, int index) => data.x,
                  yValueMapper: (ChartData data, int index) => data.y,
                  pointColorMapper: (ChartData data, int index) => data.color,
                  animationDuration: 0,
                  radius: '60%',
                  innerRadius: '70%',
                ),
              ],
            ),
          ),
          '1969',
          156),
      _createAnnotation(
          Text("Coal consumption across \nthe world from 1965 to 2023.",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          '1976',
          156),
      _createAnnotation(Text("Europe", style: textStyle), '1986', 10),
      _createAnnotation(Text("Rest Of World", style: textStyle), '1995', 24),
      _createAnnotation(Text("North America", style: textStyle), '2002', 40),
      _createAnnotation(Text("Asia Pacific", style: textStyle), '2010', 83),
      _createAnnotation(
          createDecoratedBox('$asiaPacific', Colors.red, Colors.red.shade100),
          '2022',
          167),
      _createAnnotation(
          createDecoratedBox(
              '$northAmerica', Colors.blue, Colors.blue.shade100),
          '2022',
          36),
      _createAnnotation(
          createDecoratedBox(
              '$restOfWorld', Colors.green, Colors.green.shade100),
          '2022',
          24),
      _createAnnotation(
          createDecoratedBox('$europe', Colors.yellow, Colors.yellow.shade100),
          '2022',
          14),
    ];
  }

  // Helper function to create CartesianChartAnnotation
  CartesianChartAnnotation _createAnnotation(
      Widget widget, String x, double y) {
    return CartesianChartAnnotation(
      widget: widget,
      x: x,
      y: y,
      coordinateUnit: CoordinateUnit.point,
    );
  }

  // Helper function to create DecoratedBox with text
  Widget createDecoratedBox(String text, Color borderColor, Color color) {
    return Center(
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(width: 2.5, color: borderColor),
          borderRadius: BorderRadius.circular(4),
          color: color,
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  List<StackedAreaSeries<CoalConsumptionData, String>>
      _buildStackedAreaSeries() {
    final List<double Function(CoalConsumptionData, int)>
        regionDataMappers = [
      (CoalConsumptionData data, int index) => data.asiaPacific,
      (CoalConsumptionData data, int index) => data.restOfWorld,
      (CoalConsumptionData data, int index) => data.northAmerica,
      (CoalConsumptionData data, int index) => data.europe,
    ];

    return List.generate(4, (index) {
      return StackedAreaSeries<CoalConsumptionData, String>(
        dataSource: coalConsumptionData,
        xValueMapper: (CoalConsumptionData data, _) => data.year,
        yValueMapper: regionDataMappers[index],
        onCreateRenderer: (ChartSeries<dynamic, dynamic> series) =>
            CustomStackedAreaRenderer(
                series as StackedAreaSeries<CoalConsumptionData, String>,
                index),
      );
    });
  }
}

class CoalConsumptionData {
  final String year;
  final double europe;
  final double restOfWorld;
  final double northAmerica;
  final double asiaPacific;

  CoalConsumptionData(this.year, this.europe, this.restOfWorld,
      this.northAmerica, this.asiaPacific);
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}

class CustomStackedAreaRenderer<T, D> extends StackedAreaSeriesRenderer<T, D> {
  final int seriesIndex;
  static final Map<int, List<Offset>> bottomBoundary = {};

  CustomStackedAreaRenderer(StackedAreaSeries<T, D> series, this.seriesIndex)
      : super();

  @override
  StackedAreaSegment<T, D> createSegment() {
    return CustomStackedAreaSegment<T, D>(seriesIndex);
  }
}

class CustomStackedAreaSegment<T, D> extends StackedAreaSegment<T, D> {
  final int seriesIndex;
  ui.Image? backgroundImage;
  static final Map<int, ui.Image> _loadedImages = {};

  CustomStackedAreaSegment(this.seriesIndex) {
    _loadImageForSeries();
  }

  final List<Color> overlayColor = [
    Colors.yellow.withValues(alpha: 0.5),
    Colors.green.withValues(alpha: 0.5),
    Colors.blueAccent.withValues(alpha: 0.5),
    Colors.redAccent.withValues(alpha: 0.5),
  ];

  final List<String> images = [
    'assets/coal1.jpg',
    'assets/coal2.jpg',
    'assets/coal1.jpg',
    'assets/coal3.jpg',
  ];

  void _loadImageForSeries() async {
    if (_loadedImages.containsKey(seriesIndex)) {
      backgroundImage = _loadedImages[seriesIndex];
    } else {
      //Load image based on seriesIndex.
      final ByteData data = await rootBundle.load(images[seriesIndex]);
      final codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
      final frame = await codec.getNextFrame();
      backgroundImage = frame.image;
      _loadedImages[seriesIndex] = backgroundImage!;
    }
  }

  @override
  void onPaint(Canvas canvas) {
    if (points.isEmpty || backgroundImage == null) return;

    Path segmentPath = _generateSegmentPath(canvas);
    _storeBottomBoundaryPoints();

    // Paint for the image background
    Paint fillPaint = Paint()
      ..color = Colors.black.withValues(alpha: 0.4)
      ..blendMode = BlendMode.darken
      ..shader = ImageShader(
        backgroundImage!,
        TileMode.repeated,
        TileMode.repeated,
        Matrix4.diagonal3Values(1, 1, 1).storage,
      );

    canvas.drawPath(segmentPath, fillPaint);

    // Overlay color
    final overlayPaint = Paint()
      ..color = overlayColor[seriesIndex]
      ..style = PaintingStyle.fill;
    canvas.drawPath(segmentPath, overlayPaint);

    // Border
    final seriesBorder = Paint()
      ..color = Colors.black
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;
    canvas.drawPath(segmentPath, seriesBorder);
  }

  Path _generateSegmentPath(Canvas canvas) {
    Path path = Path()..moveTo(points.first.dx, points.first.dy);
    for (int i = 1; i < points.length; i++) {
      path.lineTo(points[i].dx, points[i].dy);
    }

    List<Offset> bottomPoints =
        CustomStackedAreaRenderer.bottomBoundary[seriesIndex - 1] ?? [];
    if (seriesIndex == 0 || bottomPoints.isEmpty) {
      double chartBottomY = canvas.getLocalClipBounds().bottom;
      for (int i = points.length - 1; i >= 0; i--) {
        path.lineTo(points[i].dx, chartBottomY);
      }
    } else {
      for (int i = points.length - 1; i >= 0; i--) {
        path.lineTo(bottomPoints[i].dx, bottomPoints[i].dy);
      }
    }
    return path..close();
  }

  void _storeBottomBoundaryPoints() {
    CustomStackedAreaRenderer.bottomBoundary[seriesIndex] = List.from(points);
  }
}
