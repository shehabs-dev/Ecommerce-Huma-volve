import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/view/login/screens/login_screen.dart';
import '../../features/auth/presentation/view/sign_up/screens/sign_up_screen.dart';
import '../../features/auth/presentation/view_model/auth_cubit.dart';
import '../../features/details/presentation/view/screens/product_details_screen.dart';
import '../../features/main_navigation/screens/main_navigation_screen.dart';
import '../../features/splash/screens/splash_screen.dart';
import '../di/injection_container.dart';
import '../widgets/not_found_page.dart';
import 'app_routes.dart';
import 'route_transitions.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: AppRoutes.initialRoute,
      pageBuilder: (context, state) => RouteTransitions.none(
        BlocProvider(
          create: (context) => sl<AuthCubit>()..checkAuthStatus(),
          child: const SplashScreen(),
        ),
        state,
      ),
    ),

    GoRoute(
      path: AppRoutes.productDetailsPath,
      name: AppRoutes.productDetails,

      builder: (context, state) {
        final productId = int.tryParse(state.pathParameters['id'] ?? '');
        if (productId == null) {
          return NotFoundPage();
        }
        return ProductDetailsScreen(productId: productId);
      },
    ),

    GoRoute(
      path: AppRoutes.signInPath,
      name: AppRoutes.signIn,

      pageBuilder: (context, state) =>
          RouteTransitions.fade(const LoginScreen(), state),
    ),
    GoRoute(
      path: AppRoutes.signUpPath,
      name: AppRoutes.signUp,
      pageBuilder: (context, state) =>
          RouteTransitions.slideFromEnd(const SignUpScreen(), state),
    ),
    GoRoute(
      path: AppRoutes.homePath,
      name: AppRoutes.home,
      pageBuilder: (context, state) =>
          RouteTransitions.fade(const MainNavigationScreen(), state),
    ),
  ],
);
