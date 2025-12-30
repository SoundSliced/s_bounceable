import 'package:flutter/material.dart';

/// A Bounceable widget that supports both single tap and double tap
class SBounceable extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onDoubleTap;
  final double? scaleFactor;
  final Duration? duration;
  final bool isBounceEnabled;

  const SBounceable({
    super.key,
    required this.child,
    this.onTap,
    this.onDoubleTap,
    this.scaleFactor,
    this.duration,
    this.isBounceEnabled = true,
  });

  @override
  State<SBounceable> createState() => _SBounceableState();
}

class _SBounceableState extends State<SBounceable> {
  double _scale = 1.0;

  double get _scaleFactor => widget.scaleFactor ?? 0.95;
  Duration get _duration =>
      widget.duration ?? const Duration(milliseconds: 100);

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _scale = _scaleFactor;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _scale = 1.0;
    });
  }

  void _onTapCancel() {
    setState(() {
      _scale = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      onTap: widget.onTap,
      onDoubleTap: widget.onDoubleTap,
      child: AnimatedScale(
        scale: widget.isBounceEnabled ? _scale : 1.0,
        duration: _duration,
        curve: Curves.easeInOut,
        child: widget.child,
      ),
    );
  }
}
