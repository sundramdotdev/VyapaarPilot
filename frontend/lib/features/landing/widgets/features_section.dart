import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';

/// Section 11: Premium Feature Grid
/// Showcases the 6 grounded pillars of VyapaarPilot without fluff or unsupported claims.
class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isDesktop = screenWidth >= 1024;
    final isTablet = screenWidth >= 640 && screenWidth < 1024;

    return Container(
      width: double.infinity,
      color: AppColors.background,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? AppSpacing.xxxl : AppSpacing.lg,
        vertical: isDesktop ? 88.0 : 56.0,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: AppBreakpoints.maxContentWidth,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Eyebrow
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 4.0,
                ),
                decoration: BoxDecoration(
                  color: AppColors.lightBlue,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: const Text(
                  'COMPREHENSIVE CAPABILITIES',
                  style: TextStyle(
                    fontSize: 11.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.8,
                    color: AppColors.secondaryBlue,
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.sm),

              // Headline
              Text(
                'Everything you need to turn transactions\ninto commercial growth.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isDesktop ? 34.0 : 24.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                  height: 1.25,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),

              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 680),
                child: const Text(
                  'Designed specifically for the reality of Indian retail: high transaction volume, razor-thin margins, and zero time to waste on complex software.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: AppColors.textSecondary,
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 52.0),

              // 6 Features in 3x2 Grid (Desktop) or 2x3 (Tablet) or 1x6 (Mobile)
              if (isDesktop)
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: _buildFeatureCard(
                            icon: Icons.chat_bubble_outline_rounded,
                            title: 'AI Business Copilot',
                            tagline: 'Plain Language Q&A',
                            description:
                                'Ask questions about yesterday\'s footfall, weekly totals, or top products in Hindi, English, or Hinglish.',
                            accentColor: AppColors.primary,
                          ),
                        ),
                        const SizedBox(width: AppSpacing.lg),
                        Expanded(
                          child: _buildFeatureCard(
                            icon: Icons.auto_graph_rounded,
                            title: 'Smart Analytics',
                            tagline: 'Computed from Timestamp Logs',
                            description:
                                'Dynamic daily, weekly, and monthly trends calculated directly from your real ledger. No stale snapshots.',
                            accentColor: AppColors.secondaryBlue,
                          ),
                        ),
                        const SizedBox(width: AppSpacing.lg),
                        Expanded(
                          child: _buildFeatureCard(
                            icon: Icons.radar_rounded,
                            title: 'Opportunity Detection',
                            tagline: 'Automated Anomaly Watch',
                            description:
                                'Heuristic algorithms continuously scan for recurring sales slumps, payment drop-offs, and inactive repeat buyers.',
                            accentColor: AppColors.warning,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: _buildFeatureCard(
                            icon: Icons.lightbulb_outline_rounded,
                            title: 'AI Recommendations',
                            tagline: 'Contextual Action Plans',
                            description:
                                'Every detected slump is paired with a concrete commercial recommendation tailored to Kirana & retail economics.',
                            accentColor: Color(0xFF0D9488),
                          ),
                        ),
                        const SizedBox(width: AppSpacing.lg),
                        Expanded(
                          child: _buildFeatureCard(
                            icon: Icons.science_outlined,
                            title: 'Controlled Experiments',
                            tagline: 'Test & Measure Outcomes',
                            description:
                                'Launch bounded 3-hour promotional experiments and compare actual performance against statistical historical baselines.',
                            accentColor: AppColors.success,
                          ),
                        ),
                        const SizedBox(width: AppSpacing.lg),
                        Expanded(
                          child: _buildFeatureCard(
                            icon: Icons.mic_none_rounded,
                            title: 'Voice Assistant',
                            tagline: 'Hands-Free Merchant Audio',
                            description:
                                'Speak naturally while packing goods behind the counter. Multilingual STT and voice playback built for retail noise.',
                            accentColor: Color(0xFF7C3AED),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              else if (isTablet)
                Wrap(
                  spacing: AppSpacing.lg,
                  runSpacing: AppSpacing.lg,
                  children: [
                    _buildFeatureCard(
                      icon: Icons.chat_bubble_outline_rounded,
                      title: 'AI Business Copilot',
                      tagline: 'Plain Language Q&A',
                      description:
                          'Ask questions about yesterday\'s footfall, weekly totals, or top products in Hindi, English, or Hinglish.',
                      accentColor: AppColors.primary,
                      width: (screenWidth - 80) / 2,
                    ),
                    _buildFeatureCard(
                      icon: Icons.auto_graph_rounded,
                      title: 'Smart Analytics',
                      tagline: 'Computed from Timestamp Logs',
                      description:
                          'Dynamic daily, weekly, and monthly trends calculated directly from your real ledger. No stale snapshots.',
                      accentColor: AppColors.secondaryBlue,
                      width: (screenWidth - 80) / 2,
                    ),
                    _buildFeatureCard(
                      icon: Icons.radar_rounded,
                      title: 'Opportunity Detection',
                      tagline: 'Automated Anomaly Watch',
                      description:
                          'Heuristic algorithms continuously scan for recurring sales slumps, payment drop-offs, and inactive repeat buyers.',
                      accentColor: AppColors.warning,
                      width: (screenWidth - 80) / 2,
                    ),
                    _buildFeatureCard(
                      icon: Icons.lightbulb_outline_rounded,
                      title: 'AI Recommendations',
                      tagline: 'Contextual Action Plans',
                      description:
                          'Every detected slump is paired with a concrete commercial recommendation tailored to Kirana & retail economics.',
                      accentColor: const Color(0xFF0D9488),
                      width: (screenWidth - 80) / 2,
                    ),
                    _buildFeatureCard(
                      icon: Icons.science_outlined,
                      title: 'Controlled Experiments',
                      tagline: 'Test & Measure Outcomes',
                      description:
                          'Launch bounded 3-hour promotional experiments and compare actual performance against statistical historical baselines.',
                      accentColor: AppColors.success,
                      width: (screenWidth - 80) / 2,
                    ),
                    _buildFeatureCard(
                      icon: Icons.mic_none_rounded,
                      title: 'Voice Assistant',
                      tagline: 'Hands-Free Merchant Audio',
                      description:
                          'Speak naturally while packing goods behind the counter. Multilingual STT and voice playback built for retail noise.',
                      accentColor: const Color(0xFF7C3AED),
                      width: (screenWidth - 80) / 2,
                    ),
                  ],
                )
              else
                Column(
                  children: [
                    _buildFeatureCard(
                      icon: Icons.chat_bubble_outline_rounded,
                      title: 'AI Business Copilot',
                      tagline: 'Plain Language Q&A',
                      description:
                          'Ask questions about yesterday\'s footfall, weekly totals, or top products in Hindi, English, or Hinglish.',
                      accentColor: AppColors.primary,
                    ),
                    const SizedBox(height: AppSpacing.md),
                    _buildFeatureCard(
                      icon: Icons.auto_graph_rounded,
                      title: 'Smart Analytics',
                      tagline: 'Computed from Timestamp Logs',
                      description:
                          'Dynamic daily, weekly, and monthly trends calculated directly from your real ledger. No stale snapshots.',
                      accentColor: AppColors.secondaryBlue,
                    ),
                    const SizedBox(height: AppSpacing.md),
                    _buildFeatureCard(
                      icon: Icons.radar_rounded,
                      title: 'Opportunity Detection',
                      tagline: 'Automated Anomaly Watch',
                      description:
                          'Heuristic algorithms continuously scan for recurring sales slumps, payment drop-offs, and inactive repeat buyers.',
                      accentColor: AppColors.warning,
                    ),
                    const SizedBox(height: AppSpacing.md),
                    _buildFeatureCard(
                      icon: Icons.lightbulb_outline_rounded,
                      title: 'AI Recommendations',
                      tagline: 'Contextual Action Plans',
                      description:
                          'Every detected slump is paired with a concrete commercial recommendation tailored to Kirana & retail economics.',
                      accentColor: const Color(0xFF0D9488),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    _buildFeatureCard(
                      icon: Icons.science_outlined,
                      title: 'Controlled Experiments',
                      tagline: 'Test & Measure Outcomes',
                      description:
                          'Launch bounded 3-hour promotional experiments and compare actual performance against statistical historical baselines.',
                      accentColor: AppColors.success,
                    ),
                    const SizedBox(height: AppSpacing.md),
                    _buildFeatureCard(
                      icon: Icons.mic_none_rounded,
                      title: 'Voice Assistant',
                      tagline: 'Hands-Free Merchant Audio',
                      description:
                          'Speak naturally while packing goods behind the counter. Multilingual STT and voice playback built for retail noise.',
                      accentColor: const Color(0xFF7C3AED),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String tagline,
    required String description,
    required Color accentColor,
    double? width,
  }) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppRadius.roundedMedium,
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: accentColor.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: accentColor.withValues(alpha: 0.2)),
            ),
            child: Icon(icon, color: accentColor, size: 22),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 2.0),
          Text(
            tagline,
            style: TextStyle(
              fontSize: 11.0,
              fontWeight: FontWeight.w600,
              color: accentColor,
              letterSpacing: 0.2,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            description,
            style: const TextStyle(
              fontSize: 13.0,
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
