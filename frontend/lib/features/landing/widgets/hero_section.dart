import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/routing/app_router.dart';
import 'landing_vectors.dart';

/// Hero Section for VyapaarPilot.
/// Highlights the core value proposition and provides a grounded, realistic product composition
/// showing merchant question ("Meri Tuesday evening sales kyun gir rahi hain?"), grounded insight,
/// comparative baseline chart, and human-confirmed recommended action.
class HeroSection extends StatelessWidget {
  final VoidCallback onHowItWorksTap;

  const HeroSection({super.key, required this.onHowItWorksTap});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isDesktop = screenWidth >= 1024;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.background,
        border: Border(
          bottom: BorderSide(color: AppColors.divider, width: 1.0),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? AppSpacing.xxxl : AppSpacing.lg,
        vertical: isDesktop ? 64.0 : 40.0,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: AppBreakpoints.maxContentWidth,
          ),
          child: isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 6,
                      child: _buildLeftHeroContent(context, true),
                    ),
                    const SizedBox(width: 48.0),
                    Expanded(
                      flex: 5,
                      child: _buildRightProductComposition(context, true),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLeftHeroContent(context, false),
                    const SizedBox(height: 48.0),
                    _buildRightProductComposition(context, false),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildLeftHeroContent(BuildContext context, bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Eyebrow badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
          decoration: BoxDecoration(
            color: AppColors.lightBlue,
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              color: AppColors.secondaryBlue.withValues(alpha: 0.2),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8.0,
                height: 8.0,
                decoration: const BoxDecoration(
                  color: AppColors.paymentBlue,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8.0),
              const Flexible(
                child: Text(
                  'AI growth partner for small merchants',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                    letterSpacing: 0.2,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),

        // Headline
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: isDesktop ? 44.0 : 30.0,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
              height: 1.15,
              letterSpacing: -1.0,
            ),
            children: const [
              TextSpan(
                text: 'Your payments know what happened.\nVyapaarPilot tells you ',
              ),
              TextSpan(
                text: 'what to do next.',
                style: TextStyle(color: AppColors.paymentBlue),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),

        // Supporting copy
        Text(
          'Your business data has answers. VyapaarPilot helps you act on them. Ask about your sales, customers, or opportunities in plain language — and get actionable insights and testable experiments backed by your business data.',
          style: TextStyle(
            fontSize: isDesktop ? 16.0 : 14.0,
            color: AppColors.textSecondary,
            height: 1.5,
          ),
        ),
        const SizedBox(height: AppSpacing.xxl),

        // Action Buttons
        Wrap(
          spacing: AppSpacing.md,
          runSpacing: AppSpacing.sm,
          children: [
            ElevatedButton(
              key: const Key('landing_hero_explore_button'),
              onPressed: () {
                Navigator.pushNamed(context, AppRouter.dashboard);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(
                  horizontal: isDesktop ? 24.0 : 18.0,
                  vertical: isDesktop ? 16.0 : 13.0,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: AppRadius.roundedSmall,
                ),
                elevation: 0,
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(
                      'Explore VyapaarPilot',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Icon(Icons.arrow_forward_rounded, size: 18.0),
                ],
              ),
            ),
            OutlinedButton(
              key: const Key('landing_hero_how_it_works_button'),
              onPressed: onHowItWorksTap,
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.primary,
                side: const BorderSide(color: AppColors.border, width: 1.5),
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(
                  horizontal: isDesktop ? 20.0 : 16.0,
                  vertical: isDesktop ? 16.0 : 13.0,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: AppRadius.roundedSmall,
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.play_circle_outline_rounded,
                    size: 18.0,
                    color: AppColors.secondaryBlue,
                  ),
                  SizedBox(width: 8.0),
                  Flexible(
                    child: Text(
                      'See how it works',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.xl),

        // Trust line
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.verified_user_outlined,
              size: 15.0,
              color: AppColors.success,
            ),
            const SizedBox(width: 6.0),
            Flexible(
              child: Text(
                'Built on synthetic merchant data • Human-approved actions',
                style: TextStyle(
                  fontSize: 12.0,
                  color: AppColors.textSecondary.withValues(alpha: 0.9),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRightProductComposition(BuildContext context, bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // 1. Merchant Voice Question Pill
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            margin: const EdgeInsets.only(bottom: 12.0, right: 8.0),
            padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(4),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.25),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.mic, color: AppColors.paymentBlue, size: 16),
                SizedBox(width: 6.0),
                Flexible(
                  child: Text(
                    '"Meri Tuesday evening sales kyun gir rahi hain?"',
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // 2. Main Grounded Copilot Insight Card
        Container(
          padding: EdgeInsets.all(isDesktop ? AppSpacing.xl : AppSpacing.md),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: AppRadius.roundedLarge,
            border: Border.all(color: AppColors.border),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.08),
                blurRadius: 28,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Store Header & Copilot Badge
              Wrap(
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 8.0,
                runSpacing: 8.0,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: AppColors.lightBlue,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: const Icon(
                          Icons.storefront,
                          color: AppColors.primary,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      const Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sharma General Store',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            Text(
                              'Lucknow • Retail • Live Analysis',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 10.0,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 3.0,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.warningLight,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: const Text(
                      'OPPORTUNITY DETECTED',
                      style: TextStyle(
                        fontSize: 9.0,
                        fontWeight: FontWeight.bold,
                        color: AppColors.warning,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.lg),

              // Insight Headline & Core Finding
              const Text(
                'Tuesday 4–7 PM sales are 24% below normal',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                  letterSpacing: -0.3,
                ),
              ),
              const SizedBox(height: 4.0),
              const Text(
                'Identified consistently across the last 4 weeks. Normal baseline: ₹13,800 vs Recent average: ₹10,488.',
                style: TextStyle(
                  fontSize: 12.0,
                  color: AppColors.textSecondary,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: AppSpacing.md),

              // Mini Visual Chart Comparison
              Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: AppRadius.roundedSmall,
                  border: Border.all(color: AppColors.border),
                ),
                child: Column(
                  children: [
                    Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 8.0,
                      runSpacing: 4.0,
                      children: [
                        const Text(
                          'Tuesday 4–7 PM Revenue Comparison',
                          style: TextStyle(
                            fontSize: 11.0,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6.0,
                            vertical: 2.0,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.warningLight,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: const Text(
                            '-₹3,312 gap',
                            style: TextStyle(
                              fontSize: 10.0,
                              fontWeight: FontWeight.bold,
                              color: AppColors.warning,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12.0),
                    // Comparison Bars
                    _buildComparisonBar(
                      label: 'Normal Baseline (Weeks 5-12)',
                      amount: '₹13,800',
                      progress: 1.0,
                      barColor: AppColors.secondaryBlue,
                    ),
                    const SizedBox(height: 8.0),
                    _buildComparisonBar(
                      label: 'Recent 4-Week Average',
                      amount: '₹10,488',
                      progress: 0.76,
                      barColor: AppColors.warning,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.md),

              // Recommended Next Action Card
              Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: AppColors.veryLightBlue,
                  borderRadius: AppRadius.roundedSmall,
                  border: Border.all(
                    color: AppColors.secondaryBlue.withValues(alpha: 0.4),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        color: AppColors.secondaryBlue,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.rocket_launch_rounded,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'RECOMMENDED EXPERIMENT',
                            style: TextStyle(
                              fontSize: 9.0,
                              fontWeight: FontWeight.bold,
                              color: AppColors.secondaryBlue,
                            ),
                          ),
                          Text(
                            'Run a 10% Snack & Tea Combo discount next Tuesday (4–7 PM)',
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                      decoration: BoxDecoration(
                        color: AppColors.successLight,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        '+25% uplift',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: AppColors.success,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildComparisonBar({
    required String label,
    required String amount,
    required double progress,
    required Color barColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 10.0,
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(width: 8.0),
            Text(
              amount,
              style: TextStyle(
                fontSize: 11.0,
                fontWeight: FontWeight.bold,
                color: barColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4.0),
        ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: AppColors.divider,
            valueColor: AlwaysStoppedAnimation<Color>(barColor),
            minHeight: 6.0,
          ),
        ),
      ],
    );
  }
}
