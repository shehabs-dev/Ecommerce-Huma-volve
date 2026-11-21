import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouteTransitions {
  static const _duration = Duration(milliseconds: 300);

  // One helper builds every page, so each transition below is only a few lines.
  static CustomTransitionPage<void> _build(
    GoRouterState state,
    Widget child,
    Widget Function(BuildContext, Animation<double>, Widget) transition, {
    Duration duration = _duration,
  }) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: child,
      transitionDuration: duration,
      reverseTransitionDuration: duration,
      transitionsBuilder: (context, animation, _, child) {
        // Respect the phone's "reduce motion" accessibility setting
        if (MediaQuery.disableAnimationsOf(context)) return child;
        return transition(context, animation, child);
      },
    );
  }

  /// Fade: splash / onboarding -> home
  static CustomTransitionPage<void> fade(Widget child, GoRouterState state) =>
      _build(state, child, (context, animation, child) {
        return FadeTransition(opacity: animation, child: child);
      });

  /// Slide from the END side: right in English, left in Arabic (RTL-safe)
  static CustomTransitionPage<void> slideFromEnd(
    Widget child,
    GoRouterState state,
  ) => _build(state, child, (context, animation, child) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    return SlideTransition(
      position: Tween(
        begin: Offset(isRtl ? -1 : 1, 0),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic)),
      child: child,
    );
  });

  /// Slide from the bottom: modals, auth pages
  static CustomTransitionPage<void> slideFromBottom(
    Widget child,
    GoRouterState state,
  ) => _build(state, child, (context, animation, child) {
    return SlideTransition(
      position: Tween(
        begin: const Offset(0, 1),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic)),
      child: child,
    );
  });

  /// Fade + scale: best for sign in -> home ("arriving" feeling)
  static CustomTransitionPage<void> fadeScale(
    Widget child,
    GoRouterState state,
  ) => _build(state, child, (context, animation, child) {
    final curved = CurvedAnimation(
      parent: animation,
      curve: Curves.easeOutCubic,
    );
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: Tween(begin: 0.92, end: 1.0).animate(curved),
        child: child,
      ),
    );
  }, duration: const Duration(milliseconds: 400));

  /// No animation: instant swap (for example after logout)
  static Page<void> none(Widget child, GoRouterState state) =>
      NoTransitionPage<void>(key: state.pageKey, child: child);
}
