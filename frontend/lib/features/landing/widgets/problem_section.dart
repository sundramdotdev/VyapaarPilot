import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import 'landing_vectors.dart';

/// Section 3: The Problem
/// Demonstrates the real gap: Running a shop takes enough time — understanding the numbers shouldn't require a data analyst.
class ProblemSection extends StatelessWidget {
  const ProblemSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isDesktop = screenWidth >= 960;

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Eyebrow
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 4.0,
                ),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: const Text(
                  'THE VISIBILITY GAP',
                  style: TextStyle(
                    fontSize: 11.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.8,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.sm),

              // Headline (preserving tested string 'Payments tell merchants what happened.')
              Text(
                'Running a shop takes enough time.\nPayments tell merchants what happened. Not what to do next.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isDesktop ? 32.0 : 23.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                  height: 1.25,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),

              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 720),
                child: const Text(
                  'Understanding your numbers shouldn\'t require a data analyst. Today, crucial patterns stay buried in transaction histories, and traditional dashboards just show numbers without explaining what to do tomorrow.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: AppColors.textSecondary,
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 48.0),

              // Side-by-side or stacked comparison (Merchants Have Today vs Merchants Still Need)
              if (isDesktop)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: _buildMerchantsHaveCard()),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          PaymentStreamVector(width: 80.0, height: 32.0),
                          SizedBox(height: 4.0),
                          Icon(
                            Icons.arrow_forward_rounded,
                            color: AppColors.secondaryBlue,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                    Expanded(child: _buildMerchantsNeedCard()),
                  ],
                )
              else
                Column(
                  children: [
                    _buildMerchantsHaveCard(),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: AppSpacing.md),
                      child: Icon(
                        Icons.arrow_downward_rounded,
                        color: AppColors.secondaryBlue,
                        size: 24,
                      ),
                    ),
                    _buildMerchantsNeedCard(),
                  ],
                ),

              const SizedBox(height: 40.0),

              // 4 Key Friction Points in Grid
              Wrap(
                spacing: AppSpacing.lg,
                runSpacing: AppSpacing.md,
                alignment: WrapAlignment.center,
                children: [
                  _buildFrictionPoint(
                    icon: Icons.table_chart_outlined,
                    title: 'Buried in Ledger Logs',
                    desc: 'Patterns are hidden across hundreds of daily micro-payments.',
                  ),
                  _buildFrictionPoint(
                    icon: Icons.help_outline_rounded,
                    title: 'What vs Why',
                    desc: 'Merchants see lower daily sales, but don\'t know which hours caused it.',
                  ),
                  _buildFrictionPoint(
                    icon: Icons.radar_rounded,
                    title: 'Missed Opportunities',
                    desc: 'Recurring Tuesday or evening slowdowns go unnoticed for months.',
                  ),
                  _buildFrictionPoint(
                    icon: Icons.call_missed_outgoing_rounded,
                    title: 'No Actionable Next Step',
                    desc: 'Traditional charts end at graphs. Merchants need concrete experiments.',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFrictionPoint({
    required IconData icon,
    required String title,
    required String desc,
  }) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: AppRadius.roundedSmall,
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: AppColors.secondaryBlue),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 2.0),
                Text(
                  desc,
                  style: const TextStyle(
                    fontSize: 11.0,
                    color: AppColors.textSecondary,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMerchantsHaveCard() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: AppRadius.roundedMedium,
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6.0),
                  border: Border.all(color: AppColors.border),
                ),
                child: const Icon(
                  Icons.receipt_long_rounded,
                  color: AppColors.textSecondary,
                  size: 18,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              const Expanded(
                child: Text(
                  'WHAT MERCHANTS HAVE TODAY',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          const Text(
            '₹18,420',
            style: TextStyle(
              fontSize: 26.0,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const Text(
            "Today's total sales volume",
            style: TextStyle(fontSize: 12.0, color: AppColors.textSecondary),
          ),
          const SizedBox(height: AppSpacing.md),
          const Divider(color: AppColors.divider, height: 1.0),
          const SizedBox(height: AppSpacing.md),
          _buildItem(
            Icons.check_circle_outline,
            'Raw transaction history & logs',
            AppColors.textSecondary,
          ),
          const SizedBox(height: AppSpacing.sm),
          _buildItem(
            Icons.check_circle_outline,
            'Payment confirmations & Soundbox alerts',
            AppColors.textSecondary,
          ),
          const SizedBox(height: AppSpacing.sm),
          _buildItem(
            Icons.check_circle_outline,
            'End-of-day settlement reports',
            AppColors.textSecondary,
          ),
        ],
      ),
    );
  }

  Widget _buildMerchantsNeedCard() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppRadius.roundedMedium,
        border: Border.all(
          color: AppColors.paymentBlue.withValues(alpha: 0.5),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.paymentBlue.withValues(alpha: 0.06),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: AppColors.lightBlue,
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: const Icon(
                  Icons.help_outline_rounded,
                  color: AppColors.secondaryBlue,
                  size: 18,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              const Expanded(
                child: Text(
                  'WHAT MERCHANTS STILL NEED',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                    color: AppColors.secondaryBlue,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          const Text(
            'Actionable Intelligence',
            style: TextStyle(
              fontSize: 26.0,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const Text(
            'Clear answers to critical commercial questions',
            style: TextStyle(fontSize: 12.0, color: AppColors.textSecondary),
          ),
          const SizedBox(height: AppSpacing.md),
          const Divider(color: AppColors.divider, height: 1.0),
          const SizedBox(height: AppSpacing.md),
          _buildItem(
            Icons.arrow_forward_rounded,
            'Why did sales fall?',
            AppColors.primary,
          ),
          const SizedBox(height: AppSpacing.sm),
          _buildItem(
            Icons.arrow_forward_rounded,
            'Which specific period needs attention?',
            AppColors.primary,
          ),
          const SizedBox(height: AppSpacing.sm),
          _buildItem(
            Icons.arrow_forward_rounded,
            'What commercial action should I try?',
            AppColors.primary,
          ),
          const SizedBox(height: AppSpacing.sm),
          _buildItem(
            Icons.arrow_forward_rounded,
            'Did my promotional experiment actually work?',
            AppColors.primary,
          ),
        ],
      ),
    );
  }

  Widget _buildItem(IconData icon, String text, Color color) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16.0, color: color),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
