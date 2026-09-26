import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import 'landing_vectors.dart';

/// Section 15: Human / Merchant-Centric Story
/// Connects deeply with the realities of Indian small retail owners.
class HumanStorySection extends StatelessWidget {
  const HumanStorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isDesktop = screenWidth >= 1024;

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? AppSpacing.xxxl : AppSpacing.lg,
        vertical: isDesktop ? 88.0 : 56.0,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: AppBreakpoints.maxContentWidth,
          ),
          child: Container(
            padding: EdgeInsets.all(isDesktop ? 48.0 : AppSpacing.lg),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.lightBlue.withValues(alpha: 0.6),
                  AppColors.veryLightBlue,
                  Colors.white,
                ],
              ),
              borderRadius: AppRadius.roundedLarge,
              border: Border.all(
                color: AppColors.secondaryBlue.withValues(alpha: 0.2),
              ),
            ),
            child: isDesktop
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 7,
                        child: _buildNarrativeContent(isDesktop),
                      ),
                      const SizedBox(width: 48.0),
                      const Expanded(
                        flex: 4,
                        child: Center(
                          child: MerchantStoreVector(
                            width: 200,
                            height: 160,
                          ),
                        ),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: MerchantStoreVector(
                          width: 160,
                          height: 120,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.xl),
                      _buildNarrativeContent(isDesktop),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildNarrativeContent(bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: const Text(
            'THE MISSION',
            style: TextStyle(
              fontSize: 10.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.8,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Text(
          'Built for the person behind the counter, not the person behind the spreadsheet.',
          style: TextStyle(
            fontSize: isDesktop ? 30.0 : 22.0,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
            height: 1.25,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        const Text(
          'A Kirana owner in Lucknow or a cloth merchant in Kanpur spends their entire day managing inventory, dealing with distributors, handling cash & UPI, and attending to customers. They don\'t have a data team or a Chief Growth Officer.',
          style: TextStyle(
            fontSize: 15.0,
            color: AppColors.textSecondary,
            height: 1.6,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        const Text(
          'VyapaarPilot brings the precision of tier-1 corporate business intelligence into a simple, natural conversation. It respects the merchant\'s time, speaks their language, and focuses strictly on what can be done today to make tomorrow more profitable.',
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
            height: 1.6,
          ),
        ),
        const SizedBox(height: AppSpacing.xl),
        const Wrap(
          spacing: AppSpacing.xl,
          runSpacing: AppSpacing.sm,
          children: [
            _ValuePill(label: 'Zero Data Analyst Needed'),
            _ValuePill(label: 'Human-Confirmed Actions'),
            _ValuePill(label: 'Understands Ground Realities'),
          ],
        ),
      ],
    );
  }
}

class _ValuePill extends StatelessWidget {
  final String label;

  const _ValuePill({required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.check_circle_rounded,
          size: 16.0,
          color: AppColors.success,
        ),
        const SizedBox(width: 6.0),
        Flexible(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }
}
