import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';

import 'package:babysitterapp/controllers/auth_controller.dart';

import 'package:babysitterapp/core/constants.dart';

class LogoutButton extends HookConsumerWidget with GlobalStyles {
  LogoutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ValueNotifier<bool> isLoading = useState(false);

    return Center(
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: TextButton(
          onPressed: isLoading.value
              ? null
              : () async {
                  final bool confirmed = await showDialog<bool>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Logout'),
                          content:
                              const Text('Are you sure you want to logout?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: const Text('Logout'),
                            ),
                          ],
                        ),
                      ) ??
                      false;

                  if (!confirmed) {
                    return;
                  }

                  try {
                    isLoading.value = true;
                    await ref.read(authController.notifier).logout();

                    if (context.mounted) {
                      await Future<void>.delayed(
                        const Duration(milliseconds: 500),
                      );

                      // navigatorKey.currentState?.pushAndRemoveUntil(
                      //   PageTransition<void>(
                      //     type: PageTransitionType.rightToLeftWithFade,
                      //     duration: const Duration(milliseconds: 300),
                      //     reverseDuration: const Duration(milliseconds: 300),
                      //     child: const LoginView(),
                      //   ),
                      //   (Route<dynamic> route) => false,
                      // );
                    }
                  } catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Error logging out: $e'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  } finally {
                    isLoading.value = false;
                  }
                },
          style: TextButton.styleFrom(
            backgroundColor: isLoading.value
                ? GlobalStyles.primaryButtonColor.withOpacity(0.7)
                : GlobalStyles.primaryButtonColor,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 2,
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: isLoading.value
                ? const SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2.5,
                    ),
                  )
                : const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.logout_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Log out',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
