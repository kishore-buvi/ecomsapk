import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  final Function(int) onChange;
  final int currentSlide;

  const ImageSlider({
    super.key,
    required this.currentSlide,
    required this.onChange,
  });

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  late PageController _pageController;

  final List<String> images = [
    'images/download (1).jpg',
    'images/download (2).jpg',
    'images/download (3).jpg',
    'images/download (4).jpg',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.currentSlide);

    _pageController.addListener(() {
      int newPage = _pageController.page?.round() ?? 0;
      if (newPage != widget.currentSlide) {
        widget.onChange(newPage);
      }
    });
  }

  @override
  void didUpdateWidget(covariant ImageSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentSlide != widget.currentSlide) {
      _pageController.animateToPage(
        widget.currentSlide,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 220,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: PageView.builder(
              controller: _pageController,
              itemCount: images.length,
              onPageChanged: widget.onChange,
              itemBuilder: (context, index) {
                return Image.asset(
                  images[index],
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(Icons.broken_image, size: 50, color: Colors.grey),
                    );
                  },
                );
              },
            ),
          ),
        ),
        Positioned(
          bottom: 12,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              images.length,
                  (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: widget.currentSlide == index ? 14 : 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: widget.currentSlide == index ? Colors.black : Colors.grey.shade400,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
