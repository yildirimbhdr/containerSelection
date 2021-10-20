import 'package:flutter/material.dart';

class ContainerSelection extends StatefulWidget {
  final List<String> children;
  final int? initialIndex;
  final Color? backgroundColor;
  final Color? selectedColor;
  final TextStyle? selectedTextStyle;
  final TextStyle? unSelectedTextStyle;
  final Duration? duration;
  final Curve? curve;
  final double? radius;
  final double? padding;
  const ContainerSelection(
      {Key? key,
      required this.children,
      this.initialIndex,
      this.backgroundColor,
      this.selectedColor,
      this.selectedTextStyle,
      this.unSelectedTextStyle,
      this.duration,
      this.curve,
      this.radius,
      this.padding})
      : super(key: key);

  @override
  _ContainerSelectionState createState() => _ContainerSelectionState();
}

class _ContainerSelectionState extends State<ContainerSelection> {
  Color _backgroundColor = Colors.black12;
  Color _selectedColor = Colors.purple;
  Duration _animationDuration = const Duration(milliseconds: 250);
  double _radius = 10;
  double _padding = 4;

  int? index;
  AlignmentGeometry _alignmentGeometry = Alignment.centerLeft;
  final GlobalKey _widgetKey = GlobalKey();
  Size? _containerSize;
  @override
  void initState() {
    super.initState();
    if (widget.initialIndex != null) {
      index = widget.initialIndex;
    }
    if (widget.backgroundColor != null) {
      _backgroundColor = widget.backgroundColor!;
    }
    if (widget.selectedColor != null) {
      _selectedColor = widget.selectedColor!;
    }
    if (widget.duration != null) {
      _animationDuration = widget.duration!;
    }
    if (widget.radius != null) {
      _radius = widget.radius!;
    }
    if (widget.padding != null) {
      _padding = widget.padding!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _widgetKey,
      padding: EdgeInsets.all(_padding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_radius),
          color: _backgroundColor),
      constraints: const BoxConstraints(maxHeight: 50),
      child: Stack(
        children: [
          selectionContainer(),
          Row(
            children: widget.children.map(
              (e) {
                int currentIndex =
                    widget.children.indexWhere((element) => element == e);
                return Expanded(
                  child: InkWell(
                    onTap: () {
                      index = currentIndex;
                      _changeSelection(currentIndex);
                    },
                    child: Center(
                        child: AnimatedDefaultTextStyle(
                      style: (currentIndex == index
                              ? widget.selectedTextStyle
                              : widget.unSelectedTextStyle) ??
                          const TextStyle(),
                      duration: widget.duration!,
                      child: Text(
                        e,
                        textAlign: TextAlign.center,
                      ),
                    )),
                  ),
                );
              },
            ).toList(),
          )
        ],
      ),
    );
  }

  Widget selectionContainer() {
    getSize();
    return AnimatedAlign(
      duration: _animationDuration,
      curve: widget.curve ?? Curves.easeInOut,
      alignment: _alignmentGeometry,
      child: Container(
        height: double.infinity,
        width: (_containerSize?.width ?? widget.children.length) /
            widget.children.length,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_radius),
          color: _selectedColor,
        ),
      ),
    );
  }

  _changeSelection(int index) {
    if (widget.children.length == 1) {
      _alignmentGeometry = Alignment.bottomCenter;
    } else if (widget.children.length == 2) {
      if (index == 0) {
        _alignmentGeometry = Alignment.centerLeft;
      } else {
        _alignmentGeometry = Alignment.centerRight;
      }
    } else if (widget.children.length == 3) {
      if (index == 0) {
        _alignmentGeometry = Alignment.centerLeft;
      } else if (index == 1) {
        _alignmentGeometry = Alignment.center;
      } else {
        _alignmentGeometry = Alignment.centerRight;
      }
    }
    setState(() {});
  }

  getSize() async {
    await Future.delayed(const Duration(microseconds: 1));
    final RenderBox renderBox =
        _widgetKey.currentContext?.findRenderObject() as RenderBox;
    final Size size = renderBox.size;
    _containerSize = size;
    setState(() {});
  }
}
