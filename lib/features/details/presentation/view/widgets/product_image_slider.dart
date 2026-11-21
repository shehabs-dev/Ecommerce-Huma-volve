import 'package:flutter/material.dart';

/// Swipeable product image gallery with dot indicators.
class ProductImageSlider extends StatefulWidget {
  final List<String> images;
  final String heroTag;

  const ProductImageSlider({
    super.key,
    required this.images,
    required this.heroTag,
  });

  @override
  State<ProductImageSlider> createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Grey background doubles as the loading placeholder.
        ColoredBox(
          color: Colors.grey.shade100,
          child: PageView.builder(
            itemCount: widget.images.length,
            onPageChanged: (i) => setState(() => _current = i),
            itemBuilder: (context, index) {
              final image = Image.network(
                widget.images[index],
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => const Icon(
                  Icons.image_not_supported_outlined,
                  size: 48,
                  color: Colors.grey,
                ),
              );
              // Only the first image takes part in the Hero transition.
              return index == 0
                  ? Hero(tag: widget.heroTag, child: image)
                  : image;
            },
          ),
        ),
        if (widget.images.length > 1)
          Positioned(
            left: 0,
            right: 0,
            bottom: 48,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.images.length, (i) {
                final active = i == _current;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  width: active ? 20 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: active ? Colors.white : Colors.white54,
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),
          ),
      ],
    );
  }
}
