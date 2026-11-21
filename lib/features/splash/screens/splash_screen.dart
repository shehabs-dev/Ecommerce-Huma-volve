import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_routes.dart';
import '../../../core/theme.dart';
import '../../auth/presentation/view_model/auth_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is Unauthenticated) {
          context.goNamed(AppRoutes.signIn);
        } else if (state is Authenticated) {
          context.goNamed(AppRoutes.home);
        }
      },
      child: Scaffold(
        backgroundColor: AppTheme.background,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.shopping_bag, size: 120, color: AppTheme.primary),
              const SizedBox(height: 24),
              Text(
                'Huma-volve',
                style: Theme.of(context).textTheme.displayLarge
                    ?.copyWith(fontSize: 40, color: AppTheme.primary),
              ),
              const SizedBox(height: 8),
              Text(
                'Your Ultimate E-Commerce App',
                style: Theme.of(context).textTheme.bodyMedium
                    ?.copyWith(fontSize: 16, color: Colors.grey.shade600),
              ),
              const SizedBox(height: 48),
              CircularProgressIndicator(color: AppTheme.primary),
            ],
          ),
        ),
      ),
    );
  }
}
