import 'package:ecommerce_app_huma_volve/core/router/deep_links.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareButton extends StatelessWidget {
  final String productId;
  const ShareButton({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        SharePlus.instance.share(
          ShareParams(
            text:
                'Take look at this amazing product: ${DeepLinks.product(productId)}',

            subject: "Try Try IDK",
          ),
        );
      },
      // Same circular style as the back / favorite buttons.
      icon: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.9),
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.share, color: Colors.black, size: 18),
      ),
    );
  }
}
