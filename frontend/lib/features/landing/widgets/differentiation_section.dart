import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/routing/app_router.dart';

/// Section 7: Differentiation + Final Conversion CTA.
/// Focuses purely on the distinct value proposition of closing the commercial loop.
class DifferentiationSection extends StatelessWidget {
  const DifferentiationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isDesktop = screenWidth >= 800;

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? AppSpacing.xxxl : AppSpacing.lg,
        vertical: isDesktop ? 88.0 : 56.0,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1040),
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
                  'WHY VYAPAARPILOT',
                  style: TextStyle(
                    fontSize: 11.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.8,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.sm),

              // Headline (preserving tested string "Don't give merchants another dashboard.")
              Text(
                "Don't give merchants another dashboard.\nGive them a growth loop.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isDesktop ? 32.0 : 24.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                  height: 1.25,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 12.0),

              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 680),
                child: const Text(
                  'Traditional tools stop at reporting what happened yesterday. VyapaarPilot connects the full commercial chain from raw transaction data to measurable business recovery.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: AppColors.textSecondary,
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 48.0),

              // Comparison Table / Cards
              if (isDesktop)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _buildTraditionalCard()),
                    const SizedBox(width: 32.0),
                    Expanded(child: _buildVyapaarPilotCard()),
                  ],
                )
              else
                Column(
                  children: [
                    _buildTraditionalCard(),
                    const SizedBox(height: 20.0),
                    _buildVyapaarPilotCard(),
                  ],
                ),

              const SizedBox(height: 64.0),

              // Final Conversion Call-To-Action Banner
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: isDesktop ? 48.0 : AppSpacing.lg,
                  vertical: isDesktop ? 48.0 : 28.0,
                ),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      AppColors.deepNavy,
                      AppColors.primary,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: AppRadius.roundedLarge,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.2),
                      blurRadius: 30,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      'Stop looking at your business data.\nStart talking to it.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: isDesktop ? 32.0 : 22.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.25,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 580),
                      child: const Text(
                        'Get clearer answers, discover hidden opportunities, and decide what to do next — in plain language.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Color(0xFFBAC7D5),
                          height: 1.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xl),
                    Wrap(
                      spacing: AppSpacing.md,
                      runSpacing: AppSpacing.sm,
                      alignment: WrapAlignment.center,
                      children: [
                        ElevatedButton(
                          key: const Key('landing_open_app_button'),
                          onPressed: () {
                            Navigator.pushNamed(context, AppRouter.dashboard);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.paymentBlue,
                            foregroundColor: AppColors.deepNavy,
                            padding: EdgeInsets.symmetric(
                              horizontal: isDesktop ? 32.0 : 16.0,
                              vertical: isDesktop ? 18.0 : 12.0,
                            ),
                            shape: const RoundedRectangleBorder(
                              borderRadius: AppRadius.roundedSmall,
                            ),
                            elevation: 0,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: Text(
                                  'Open VyapaarPilot',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: isDesktop ? 15.0 : 13.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              const Icon(Icons.arrow_forward_rounded, size: 16.0),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    const Text(
                      'Hack-e-Awadh 2026 • PS-02 Merchant Growth AI',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white54,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTraditionalCard() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
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
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: const Icon(Icons.bar_chart_rounded, size: 16, color: AppColors.textSecondary),
              ),
              const SizedBox(width: AppSpacing.sm),
              const Flexible(
                child: Text(
                  'TRADITIONAL ANALYTICS',
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
          const SizedBox(height: 12.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: AppColors.border),
            ),
            child: const Text(
              'Workflow: Numbers → Merchant (passive charts)',
              style: TextStyle(fontSize: 11.0, fontWeight: FontWeight.w600, color: AppColors.textSecondary),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          _buildRow('What happened?', true, isDimmed: false),
          const SizedBox(height: AppSpacing.sm),
          _buildRow('Why does it matter?', false, isDimmed: true),
          const SizedBox(height: AppSpacing.sm),
          _buildRow('What can I try?', false, isDimmed: true),
          const SizedBox(height: AppSpacing.sm),
          _buildRow('Did it work?', false, isDimmed: true),
          const SizedBox(height: AppSpacing.lg),
          const Text(
            'Leaves the merchant with complex charts but no actionable direction.',
            style: TextStyle(
              fontSize: 12.0,
              color: AppColors.textSecondary,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVyapaarPilotCard() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppRadius.roundedMedium,
        border: Border.all(
          color: AppColors.paymentBlue.withValues(alpha: 0.6),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.paymentBlue.withValues(alpha: 0.08),
            blurRadius: 18,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8.0,
            runSpacing: 4.0,
            children: [
              const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.auto_awesome, size: 16, color: AppColors.secondaryBlue),
                  SizedBox(width: 6),
                  Text(
                    'VYAPAARPILOT',
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                      color: AppColors.secondaryBlue,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6.0,
                  vertical: 2.0,
                ),
                decoration: const BoxDecoration(
                  color: AppColors.successLight,
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                ),
                child: const Text(
                  'CLOSED LOOP',
                  style: TextStyle(
                    fontSize: 9.0,
                    fontWeight: FontWeight.bold,
                    color: AppColors.success,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.lightBlue,
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Text(
              'Data → Understanding → Insight → Recommendation → Action',
              style: TextStyle(fontSize: 11.0, fontWeight: FontWeight.bold, color: AppColors.primary),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          _buildRow('What happened?', true, isHighlight: true),
          const SizedBox(height: AppSpacing.sm),
          _buildRow('Why does it matter?', true, isHighlight: true),
          const SizedBox(height: AppSpacing.sm),
          _buildRow('What can I try?', true, isHighlight: true),
          const SizedBox(height: AppSpacing.sm),
          _buildRow('Did it work?', true, isHighlight: true),
          const SizedBox(height: AppSpacing.lg),
          const Text(
            'Detects, explains, acts, and measures measurable business outcome.',
            style: TextStyle(
              fontSize: 12.0,
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(
    String question,
    bool isSupported, {
    bool isDimmed = false,
    bool isHighlight = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: Icon(
            isSupported
                ? Icons.check_circle_rounded
                : Icons.remove_circle_outline_rounded,
            size: 16.0,
            color: isSupported
                ? (isHighlight ? AppColors.success : AppColors.textSecondary)
                : AppColors.border,
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Text(
            '"$question"',
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: isHighlight ? FontWeight.w600 : FontWeight.normal,
              color: isDimmed
                  ? AppColors.textSecondary.withValues(alpha: 0.5)
                  : AppColors.textPrimary,
              decoration: (!isSupported && isDimmed)
                  ? TextDecoration.lineThrough
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
