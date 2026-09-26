import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';

/// Section 16: Interactive FAQ Accordion
/// Answers the most common questions about VyapaarPilot accurately and concisely.
class FaqSection extends StatefulWidget {
  const FaqSection({super.key});

  @override
  State<FaqSection> createState() => _FaqSectionState();
}

class _FaqSectionState extends State<FaqSection> {
  int? _expandedIndex;

  final List<_FaqItem> _faqs = const [
    _FaqItem(
      question: 'What is VyapaarPilot?',
      answer:
          'VyapaarPilot is an AI business copilot designed specifically for small Indian merchants and retail store owners. It connects directly to transaction logs, detects recurring revenue anomalies, answers business questions in Hindi, English, and Hinglish, and helps merchants test controlled promotions to recover lost sales.',
    ),
    _FaqItem(
      question: 'Can I ask questions using voice?',
      answer:
          'Yes. VyapaarPilot includes a hands-free multilingual voice interface. Merchants can speak natural queries like "Aaj meri sales kaisi hai?" or "Tuesday ko footfall kyun girta hai?" using speech-to-text, and listen to synthesized audio responses while working behind the counter.',
    ),
    _FaqItem(
      question: 'Does it use my actual business data?',
      answer:
          'Yes. All metrics, trends, and opportunity detections are computed directly from the merchant\'s ledger and transaction timestamp records. VyapaarPilot does not guess or hallucinate metrics — every insight is grounded in historical baselines.',
    ),
    _FaqItem(
      question: 'Can it recommend actions and launch experiments?',
      answer:
          'Yes. Unlike traditional dashboards that stop at charts, VyapaarPilot proposes specific, time-bounded commercial experiments (such as a 3-hour 10% snack combo during Tuesday slumps). Every action requires human approval before execution.',
    ),
    _FaqItem(
      question: 'How does it measure whether an experiment worked?',
      answer:
          'When an experiment is completed, VyapaarPilot compares the measured revenue during that promotional period against the merchant\'s established 4-to-12-week baseline. It calculates exact percentage uplift and net incremental revenue.',
    ),
    _FaqItem(
      question: 'Is it built for small Kirana and retail merchants?',
      answer:
          'Absolutely. The entire system is engineered for the fast-paced, noise-heavy environment of Indian retail counters — where merchants don\'t have time for complex analytical tools or spreadsheet formulas.',
    ),
    _FaqItem(
      question: 'What happens when there isn\'t enough data?',
      answer:
          'VyapaarPilot enforces statistical confidence thresholds (minimum observed weeks and transaction count). If data is insufficient to establish a reliable baseline, it clearly indicates that more transaction history is needed rather than triggering false alarms.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isDesktop = screenWidth >= 1024;

    return Container(
      width: double.infinity,
      color: AppColors.background,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? AppSpacing.xxxl : AppSpacing.lg,
        vertical: isDesktop ? 88.0 : 56.0,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 840),
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
                  'FREQUENTLY ASKED QUESTIONS',
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
                'Everything you need to know.',
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
              const Text(
                'Straightforward answers about our algorithms, voice capabilities, and merchant privacy.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.0,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 48.0),

              // FAQ List
              Column(
                children: List.generate(_faqs.length, (index) {
                  final faq = _faqs[index];
                  final isExpanded = _expandedIndex == index;

                  return Container(
                    margin: const EdgeInsets.only(bottom: 12.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: AppRadius.roundedMedium,
                      border: Border.all(
                        color: isExpanded
                            ? AppColors.secondaryBlue.withValues(alpha: 0.5)
                            : AppColors.border,
                      ),
                      boxShadow: isExpanded
                          ? [
                              BoxShadow(
                                color: AppColors.secondaryBlue.withValues(alpha: 0.05),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ]
                          : null,
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _expandedIndex = isExpanded ? null : index;
                        });
                      },
                      borderRadius: AppRadius.roundedMedium,
                      child: Padding(
                        padding: const EdgeInsets.all(AppSpacing.lg),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    faq.question,
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                      color: isExpanded
                                          ? AppColors.primary
                                          : AppColors.textPrimary,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: AppSpacing.md),
                                Icon(
                                  isExpanded
                                      ? Icons.remove_circle_outline_rounded
                                      : Icons.add_circle_outline_rounded,
                                  color: isExpanded
                                      ? AppColors.secondaryBlue
                                      : AppColors.textSecondary,
                                  size: 20.0,
                                ),
                              ],
                            ),
                            if (isExpanded) ...[
                              const SizedBox(height: AppSpacing.md),
                              const Divider(
                                color: AppColors.divider,
                                height: 1.0,
                              ),
                              const SizedBox(height: AppSpacing.md),
                              Text(
                                faq.answer,
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  color: AppColors.textSecondary,
                                  height: 1.55,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FaqItem {
  final String question;
  final String answer;

  const _FaqItem({required this.question, required this.answer});
}
