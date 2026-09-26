import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/routing/app_router.dart';
import 'landing_vectors.dart';

/// Minimal, high-trust sticky top navigation for VyapaarPilot.
/// Adapts seamlessly from mobile 320px to wide desktop 1440px+.
class LandingNavBar extends StatelessWidget {
  final VoidCallback onHowItWorksTap;
  final VoidCallback onProductTap;
  final VoidCallback onFeaturesTap;
  final VoidCallback onVoiceAiTap;
  final VoidCallback onFaqTap;

  const LandingNavBar({
    super.key,
    required this.onHowItWorksTap,
    required this.onProductTap,
    required this.onFeaturesTap,
    required this.onVoiceAiTap,
    required this.onFaqTap,
  });

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.xl,
              vertical: AppSpacing.lg,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        VyapaarLogoMark(size: 28.0),
                        SizedBox(width: AppSpacing.sm),
                        Text(
                          'VyapaarPilot',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.close_rounded),
                      onPressed: () => Navigator.pop(ctx),
                    ),
                  ],
                ),
                const Divider(height: 24),
                ListTile(
                  leading: const Icon(Icons.dashboard_customize_outlined, color: AppColors.primary),
                  title: const Text('Product Overview', style: TextStyle(fontWeight: FontWeight.w600)),
                  onTap: () {
                    Navigator.pop(ctx);
                    onProductTap();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.sync_rounded, color: AppColors.secondaryBlue),
                  title: const Text('How It Works', style: TextStyle(fontWeight: FontWeight.w600)),
                  onTap: () {
                    Navigator.pop(ctx);
                    onHowItWorksTap();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.auto_awesome_outlined, color: AppColors.warning),
                  title: const Text('Features', style: TextStyle(fontWeight: FontWeight.w600)),
                  onTap: () {
                    Navigator.pop(ctx);
                    onFeaturesTap();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.mic_none_rounded, color: Color(0xFF7C3AED)),
                  title: const Text('Voice AI', style: TextStyle(fontWeight: FontWeight.w600)),
                  onTap: () {
                    Navigator.pop(ctx);
                    onVoiceAiTap();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.help_outline_rounded, color: AppColors.textSecondary),
                  title: const Text('FAQ', style: TextStyle(fontWeight: FontWeight.w600)),
                  onTap: () {
                    Navigator.pop(ctx);
                    onFaqTap();
                  },
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                    Navigator.pushNamed(context, AppRouter.dashboard);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: const RoundedRectangleBorder(
                      borderRadius: AppRadius.roundedSmall,
                    ),
                  ),
                  child: const Text(
                    'Open VyapaarPilot',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isDesktop = screenWidth >= 1024;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? AppSpacing.xxxl : (screenWidth < 400 ? AppSpacing.sm : AppSpacing.lg),
        vertical: AppSpacing.md,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: AppBreakpoints.maxContentWidth,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left: Logo & Wordmark
              InkWell(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRouter.landing,
                    (route) => false,
                  );
                },
                borderRadius: AppRadius.roundedSmall,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    VyapaarLogoMark(size: screenWidth < 400 ? 24.0 : 32.0),
                    const SizedBox(width: AppSpacing.xs),
                    Text(
                      screenWidth < 400 ? 'Vyapaar' : 'VyapaarPilot',
                      style: TextStyle(
                        fontSize: isDesktop ? 18.0 : (screenWidth < 400 ? 14.0 : 17.0),
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ],
                ),
              ),

              // Middle: Navigation links (Desktop only)
              if (isDesktop)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _NavLink(label: 'Product', onTap: onProductTap),
                    const SizedBox(width: AppSpacing.lg),
                    _NavLink(label: 'How it works', onTap: onHowItWorksTap),
                    const SizedBox(width: AppSpacing.lg),
                    _NavLink(label: 'Features', onTap: onFeaturesTap),
                    const SizedBox(width: AppSpacing.lg),
                    _NavLink(label: 'Voice AI', onTap: onVoiceAiTap),
                    const SizedBox(width: AppSpacing.lg),
                    _NavLink(label: 'FAQ', onTap: onFaqTap),
                  ],
                ),

              // Right: CTA & Mobile Hamburger
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    key: const Key('landing_nav_open_app_button'),
                    onPressed: () {
                      Navigator.pushNamed(context, AppRouter.dashboard);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: EdgeInsets.symmetric(
                        horizontal: isDesktop ? AppSpacing.lg : (screenWidth < 400 ? 8.0 : AppSpacing.md),
                        vertical: isDesktop ? AppSpacing.md : AppSpacing.sm,
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: AppRadius.roundedSmall,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          screenWidth < 400 ? 'Open' : (screenWidth < 480 ? 'Open App' : 'Open VyapaarPilot'),
                          style: TextStyle(
                            fontSize: isDesktop ? 13.0 : 12.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 4.0),
                        const Icon(Icons.arrow_forward_rounded, size: 14.0),
                      ],
                    ),
                  ),
                  if (!isDesktop && !isTablet) ...[
                    const SizedBox(width: 4.0),
                    IconButton(
                      icon: const Icon(Icons.menu_rounded, color: AppColors.primary),
                      onPressed: () => _showMobileMenu(context),
                      tooltip: 'Menu',
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _NavLink({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 6.0),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
      ),
    );
  }
}
