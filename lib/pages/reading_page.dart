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

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = themeBrightness == Brightness.light ? Colors.white : Colors.black;

    return Scaffold(
      appBar: AppBar(
        title: Text('Key Point Details'),
        actions: [
          IconButton(
            icon: Icon(Icons.color_lens),
            onPressed: () {
              setState(() {
                themeBrightness = themeBrightness == Brightness.light ? Brightness.dark : Brightness.light;
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
        ],
      ),
      body: Container(
        color: backgroundColor,
        child: PageView.builder(
          itemCount: widget.keyPoints.length,
          controller: PageController(initialPage: widget.index),
          itemBuilder: (context, pageIndex) {
            String selectedValue = widget.keyPoints[pageIndex]["content"].toString();
            return Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: SelectableText(
                  '${widget.keyPoints[pageIndex]["name"]}: ${isHighlighted ? "* " : ""}$selectedValue',
                  style: TextStyle(fontSize: 18, color: themeBrightness == Brightness.light ? Colors.black : Colors.white),
                ),
              ),
            );
          },
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
    this.ignoreCase,
    {
    required this.text,
  })  : assert(
          highlightColor == null || highlightStyle == null,
          'highlightColor and highlightStyle cannot be provided at same time.',
        ),
        highlightStyle = highlightStyle ?? style?.copyWith(color: highlightColor) ?? TextStyle(color: highlightColor),
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
/* import 'package:flutter/material.dart';

class KeyPointScreen extends StatefulWidget {
  final List<dynamic> keyPoints;
  final int index;

  KeyPointScreen({required this.keyPoints, required this.index});

  @override
  _KeyPointScreenState createState() => _KeyPointScreenState();
}

class _KeyPointScreenState extends State<KeyPointScreen> {
  Brightness themeBrightness = Brightness.light;

  @override
  Widget build(BuildContext context) {
    Color  backgroundColor = themeBrightness == Brightness.light ? Colors.white : Colors.black;

    return Scaffold(
      appBar: AppBar(
        title: Text('Key Point Details'),
        actions: [
          PopupMenuButton<Brightness>(
            icon: Icon(Icons.color_lens),
            onSelected: (Brightness brightness) {
              setState(() {
                themeBrightness = brightness;
              });
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                value: Brightness.light,
                child: Text('Light Theme'),
              ),
              PopupMenuItem(
                value: Brightness.dark,
                child: Text('Dark Theme'),
              ),
            ],
          ),
        ],
      ),
      body: Container(
        color: backgroundColor,
        child: PageView.builder(
          itemCount: widget.keyPoints.length,
          controller: PageController(initialPage: widget.index),
          itemBuilder: (context, pageIndex) {
            String selectedValue = widget.keyPoints[pageIndex]["content"].toString();
            return Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  '${widget.keyPoints[pageIndex]["name"]}: $selectedValue',
                  style: TextStyle(fontSize: 18, color: themeBrightness == Brightness.light ? Colors.black : Colors.white),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
} */