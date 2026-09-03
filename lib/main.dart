import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/supabase_service.dart';
import 'features/auth/login_page.dart';
import 'features/home/home_shell.dart';
import 'theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SnapSupabase.initialize();

  runApp(const ProviderScope(child: SnapApp()));
}

class SnapApp extends StatelessWidget {
  const SnapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SNAP',
      debugShowCheckedModeBanner: false,
      theme: SnapTheme.dark,
      home: const SplashPage(),
    );
  }
}

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 900), () {
      if (!mounted) return;

      final page = SnapSupabase.userId == null
          ? const LoginPage()
          : const HomeShell();

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => page),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'SNAP',
          style: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
