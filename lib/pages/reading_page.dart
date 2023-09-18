import 'package:ashresume/pages/notescreen.dart';
import 'package:flutter/material.dart';

class KeyPointScreen extends StatefulWidget {
  final List<dynamic> keyPoints;
  final int index;

  KeyPointScreen({required this.keyPoints, required this.index});

  @override
  _KeyPointScreenState createState() => _KeyPointScreenState();
}

class _KeyPointScreenState extends State<KeyPointScreen> {
  Brightness themeBrightness = Brightness.light;
  bool isHighlighted = false;
  late Stopwatch stopwatch;
  int totalTimeSpent = 0;
  List<String> userNotes = [];
  Map<int, bool> highlightedSections = {};

  late PageController _pageController;
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    stopwatch = Stopwatch();
    stopwatch.start();
    _pageController = PageController(initialPage: widget.index);
    _pageController.addListener(_updateProgress);
  }

  @override
  void dispose() {
    stopwatch.stop();
    totalTimeSpent += stopwatch.elapsedMilliseconds;
    stopwatch.reset();
    _pageController.removeListener(_updateProgress);
    _pageController.dispose();
    super.dispose();
  }

  void _updateProgress() {
    setState(() {
      _progress = _pageController.page! / (widget.keyPoints.length - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor =
        themeBrightness == Brightness.light ? Colors.white : Colors.black;

    return Scaffold(
      appBar: AppBar(
        title: Text('Key Point Details'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop<int>(context, totalTimeSpent);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.color_lens),
            onPressed: () {
              setState(() {
                themeBrightness = themeBrightness == Brightness.light
                    ? Brightness.dark
                    : Brightness.light;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.highlight),
            color: isHighlighted ? Colors.yellow : null,
            onPressed: () {
              setState(() {
                isHighlighted = !isHighlighted;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.note_add),
            onPressed: () async {
              final addedNote = await Navigator.push<String>(
                context,
                MaterialPageRoute(
                  builder: (context) => NoteScreen(),
                ),
              );

              if (addedNote != null) {
                setState(() {
                  userNotes.add(addedNote);
                });
              }
            },
          ),
        ],
      ),
      body: Container(
        color: backgroundColor,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: LinearProgressIndicator(
                value: _progress,
                minHeight: 10,
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                '${(_progress * 100).toStringAsFixed(2)}% Read',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                itemCount: widget.keyPoints.length,
                controller: _pageController,
                itemBuilder: (context, pageIndex) {
                  String selectedValue =
                      widget.keyPoints[pageIndex]["content"].toString();
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: SelectableText(
                        '${widget.keyPoints[pageIndex]["name"]}: ${isHighlighted ? "* " : ""}$selectedValue',
                        style: TextStyle(
                          fontSize: 18,
                          color: themeBrightness == Brightness.light
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HighlightText extends StatelessWidget {
  final String text;
  final String highlight;
  final TextStyle style;
  final TextStyle highlightStyle;
  final Color highlightColor;
  final bool ignoreCase;

  HighlightText(
    Key? key,
    this.highlight,
    this.style,
    this.highlightColor,
    TextStyle highlightStyle,
    this.ignoreCase, {
    required this.text,
  })  : assert(
          highlightColor == null || highlightStyle == null,
          'highlightColor and highlightStyle cannot be provided at same time.',
        ),
        highlightStyle = highlightStyle ??
            style?.copyWith(color: highlightColor) ??
            TextStyle(color: highlightColor),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = this.text ?? '';
    if ((highlight?.isEmpty ?? true) || text.isEmpty) {
      return Text(text, style: style);
    }

    var sourceText = ignoreCase ? text.toLowerCase() : text;
    var targetHighlight = ignoreCase ? highlight.toLowerCase() : highlight;

    List<TextSpan> spans = [];
    int start = 0;
    int indexOfHighlight;
    do {
      indexOfHighlight = sourceText.indexOf(targetHighlight, start);
      if (indexOfHighlight < 0) {
        // no highlight
        spans.add(_normalSpan(text.substring(start)));
        break;
      }
      if (indexOfHighlight > start) {
        // normal text before highlight
        spans.add(_normalSpan(text.substring(start, indexOfHighlight)));
      }
      start = indexOfHighlight + highlight.length;
      spans.add(_highlightSpan(text.substring(indexOfHighlight, start)));
    } while (true);

    return Text.rich(TextSpan(children: spans));
  }

  TextSpan _highlightSpan(String content) {
    return TextSpan(text: content, style: highlightStyle);
  }

  TextSpan _normalSpan(String content) {
    return TextSpan(text: content, style: style);
  }
}
