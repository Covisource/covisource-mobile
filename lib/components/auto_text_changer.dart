import 'dart:async';
import 'package:flutter/material.dart';

class AutoTextChanger extends StatefulWidget {
  final List<String> text;
  final int textChangeSec;
  final TextStyle textstyle;
  final bool isAnimated;
  final String initialtext;
  final int animationDuration;

  AutoTextChanger({
    @required this.text,
    this.textChangeSec,
    this.textstyle,
    this.isAnimated,
    this.initialtext,
    this.animationDuration,
  });

  @override
  _AutoTextChangerState createState() => _AutoTextChangerState();
}

class _AutoTextChangerState extends State<AutoTextChanger>
    with TickerProviderStateMixin {
  Timer timer;
  String updatetext;
  int totalsplitwords = 0;
  int textcount = 0;
  AnimationController _animController;
  Animation<Offset> _animOffset;
  List<String> values = [];

  @override
  void dispose() {
    timer.cancel();
    _animController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.text.isNotEmpty) {
      animStart();
      splitText(widget.text);
      timer = Timer.periodic(
          Duration(
              seconds: widget.textChangeSec != null ? widget.textChangeSec : 2),
          (Timer t) => updateText());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animController,
      child: SlideTransition(
        position: _animOffset,
        child: Text(
          updatetext != null
              ? updatetext
              : widget.initialtext != null
                  ? widget.initialtext
                  : widget.text[0],
          style: widget.textstyle != null
              ? widget.textstyle
              : TextStyle(fontSize: 12, color: Colors.black),
        ),
      ),
    );
  }

  updateText() {
    if (widget.text.isNotEmpty && totalsplitwords != null) {
      setState(() {
        if (widget.isAnimated != null && widget.isAnimated) {
          _animController.reset();
          _animController.forward();
        }
        updatetext = values[textcount++];
      });
    } else {
      updatetext = " ";
    }

    if (textcount == totalsplitwords) {
      setState(() {
        textcount = 0;
      });
    }
  }

  void splitText(List<String> text) {
    setState(() {
      totalsplitwords = text.length;
    });
    if (values.isNotEmpty && values.length != null) {
      values.clear();
    }
    for (int t = 0; t < text.length; t++) {
      values.add(text[t]);
    }
    setState(() {});
  }

  void animStart() {
    _animController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.animationDuration),
    );
    final curve =
        CurvedAnimation(curve: Curves.decelerate, parent: _animController);
    _animOffset = Tween<Offset>(
      begin: const Offset(0.0, 0.35),
      end: Offset.zero,
    ).animate(curve);

    _animController.forward();
  }
}
