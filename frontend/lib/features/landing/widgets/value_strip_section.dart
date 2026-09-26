import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';

/// Compact Value Strip highlighting 4 core superpowers of VyapaarPilot:
/// Understand • Discover • Act • Talk
class ValueStripSection extends StatelessWidget {
  const ValueStripSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isDesktop = screenWidth >= 1024;
    final isTablet = screenWidth >= 640 && screenWidth < 1024;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: AppColors.border.withValues(alpha: 0.6)),
          bottom: const BorderSide(color: AppColors.divider),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? AppSpacing.xxxl : AppSpacing.lg,
        vertical: AppSpacing.xl,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: AppBreakpoints.maxContentWidth,
          ),
          child: isDesktop
              ? Row(
                  children: [
                    Expanded(
                      child: _buildPillar(
                        Icons.auto_graph_rounded,
                        'Understand',
                        'Sales & customer patterns',
                        AppColors.primary,
                      ),
                    ),
                    _buildDivider(),
                    Expanded(
                      child: _buildPillar(
                        Icons.radar_rounded,
                        'Discover',
                        'Hidden opportunities',
                        AppColors.warning,
                      ),
                    ),
                    _buildDivider(),
                    Expanded(
                      child: _buildPillar(
                        Icons.rocket_launch_rounded,
                        'Act',
                        'Launch experiments',
                        AppColors.success,
                      ),
                    ),
                    _buildDivider(),
                    Expanded(
                      child: _buildPillar(
                        Icons.record_voice_over_rounded,
                        'Talk',
                        'Voice or text copilot',
                        AppColors.secondaryBlue,
                      ),
                    ),
                  ],
                )
              : isTablet
                  ? Wrap(
                      alignment: WrapAlignment.spaceAround,
                      spacing: AppSpacing.xl,
                      runSpacing: AppSpacing.lg,
                      children: [
                        _buildPillar(
                          Icons.auto_graph_rounded,
                          'Understand',
                          'Sales & customer patterns',
                          AppColors.primary,
                        ),
                        _buildPillar(
                          Icons.radar_rounded,
                          'Discover',
                          'Hidden opportunities',
                          AppColors.warning,
                        ),
                        _buildPillar(
                          Icons.rocket_launch_rounded,
                          'Act',
                          'Launch experiments',
                          AppColors.success,
                        ),
                        _buildPillar(
                          Icons.record_voice_over_rounded,
                          'Talk',
                          'Voice or text',
                          AppColors.secondaryBlue,
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        _buildPillar(
                          Icons.auto_graph_rounded,
                          'Understand',
                          'Sales & customer patterns',
                          AppColors.primary,
                        ),
                        const SizedBox(height: AppSpacing.md),
                        _buildPillar(
                          Icons.radar_rounded,
                          'Discover',
                          'Hidden opportunities',
                          AppColors.warning,
                        ),
                        const SizedBox(height: AppSpacing.md),
                        _buildPillar(
                          Icons.rocket_launch_rounded,
                          'Act',
                          'Launch experiments',
                          AppColors.success,
                        ),
                        const SizedBox(height: AppSpacing.md),
                        _buildPillar(
                          Icons.record_voice_over_rounded,
                          'Talk',
                          'Voice or text in your language',
                          AppColors.secondaryBlue,
                        ),
                      ],
                    ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 1.0,
      height: 36.0,
      color: AppColors.divider,
    );
  }

  Widget _buildPillar(
    IconData icon,
    String verb,
    String description,
    Color accentColor,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: accentColor.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: accentColor.withValues(alpha: 0.18),
              width: 1,
            ),
          ),
          child: Icon(icon, color: accentColor, size: 20),
        ),
        const SizedBox(width: AppSpacing.md),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                verb,
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                  letterSpacing: -0.2,
                ),
              ),
              const SizedBox(height: 2.0),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
