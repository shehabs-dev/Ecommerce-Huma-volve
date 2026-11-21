import 'package:ecommerce_app_huma_volve/features/splash/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../core/helper/failure_message_helper.dart';
import '../../../../../../../core/router/app_routes.dart';
import '../../../../../../../core/theme.dart';
import '../../../../../../../core/widgets/custom_text_field.dart';
import '../../../../../../../core/widgets/primary_button.dart';
import '../../../../view_model/auth_cubit.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController usernameController;
  late final TextEditingController passwordController;

  @override
  initState() {
    super.initState();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(failureMessage(state.failure))),
          );
        } else if (state is Unauthenticated) {
          context.goNamed(AppRoutes.signIn);
        } else if (state is Authenticated) {
          context.goNamed(AppRoutes.home);
        }
      },
      builder: (context, state) {
        final cubit = context.read<AuthCubit>();
        if (state is AuthLoading) {
          return SplashScreen();
        }
        return Scaffold(
          backgroundColor: AppTheme.background,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(32.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 60),
                    Icon(Icons.shopping_bag, size: 80, color: AppTheme.primary),
                    const SizedBox(height: 32),
                    Text(
                      'Welcome Back!',
                      style: Theme.of(context).textTheme.displayLarge
                          ?.copyWith(fontSize: 32),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Login to continue your shopping',
                      style: Theme.of(context).textTheme.bodyMedium
                          ?.copyWith(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 64),
                    CustomTextField(
                      controller: usernameController,
                      hintText: 'Username',
                      prefixIcon: Icons.email_outlined,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username';
                        }
                        if (value.contains('@') && value.contains('.')) {
                          return 'Please enter a valid username';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      prefixIcon: Icons.lock_outline,
                      isPassword: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: AppTheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    PrimaryButton(
                      text: 'Login',
                      onPressed: () async {
                        if (_formKey.currentState?.validate() ?? false) {
                          await cubit.signIn(
                            username: usernameController.text.trim(),
                            password: passwordController.text.trim(),
                          );
                        }
                      },
                    ),

                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\'t have an account? '),
                        GestureDetector(
                          onTap: () {
                            context.goNamed(AppRoutes.signUp);
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: AppTheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
