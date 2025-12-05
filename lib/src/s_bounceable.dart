import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

/// A Bounceable widget that supports both single tap and double tap
class SBounceable extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onDoubleTap;
  final double? scaleFactor;

  const SBounceable({
    super.key,
    required this.child,
    this.onTap,
    this.onDoubleTap,
    this.scaleFactor,
  });

  @override
  State<SBounceable> createState() => _SBounceableState();
}

class _SBounceableState extends State<SBounceable> {
  DateTime? _lastTapTime;
  static const Duration _doubleTapThreshold = Duration(milliseconds: 300);

  void _handleTap() {
    final now = DateTime.now();

    if (_lastTapTime != null &&
        now.difference(_lastTapTime!) < _doubleTapThreshold) {
      // Double tap detected
      widget.onDoubleTap?.call();
      _lastTapTime = null; // Reset to prevent triple tap
    } else {
      // Single tap - delay execution to check for double tap
      _lastTapTime = now;
      Future.delayed(_doubleTapThreshold, () {
        if (mounted && _lastTapTime == now) {
          // No second tap occurred, execute single tap
          widget.onTap?.call();
          _lastTapTime = null;
        }
      });
    }
  }

  @override
  void didUpdateWidget(covariant SBounceable oldWidget) {
    super.didUpdateWidget(oldWidget);
    // No need to call setState here as the widget will rebuild automatically
  }

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      key: ValueKey(widget.scaleFactor ?? 0.95),
      onTap: _handleTap,
      scaleFactor: widget.scaleFactor ?? 0.95,
      child: widget.child,
    );
  }
}
