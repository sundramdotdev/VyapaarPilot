import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/routing/app_router.dart';

/// Section 8: "Ask Your Business"
/// Interactive conversational experience showing how merchants talk to their data in plain language.
class AskBusinessSection extends StatefulWidget {
  const AskBusinessSection({super.key});

  @override
  State<AskBusinessSection> createState() => _AskBusinessSectionState();
}

class _AskBusinessSectionState extends State<AskBusinessSection> {
  int _selectedPromptIndex = 0;

  final List<_PromptInsightData> _prompts = const [
    _PromptInsightData(
      questionHinglish: 'Aaj meri sales kaisi hai?',
      questionEnglish: "How is today's sales performing?",
      intentBadge: 'TODAY\'S PERFORMANCE',
      badgeColor: AppColors.secondaryBlue,
      answerTitle: 'Today: ₹21,412 across 73 orders',
      answerBody:
          'Sharma ji, aaj aapki sales achhi chal rahi hai. Average order value ₹293 hai jo normal se 8% upar hai. Evening peak 7 PM - 9 PM ke beech expect ki jaa rahi hai.',
      metricPills: [
        {'label': 'Sales Today', 'value': '₹21,412.98'},
        {'label': 'Transactions', 'value': '73 orders'},
        {'label': 'Avg Order', 'value': '₹293.30'},
        {'label': 'Success Rate', 'value': '97.3%'},
      ],
      actionLabel: 'View Detailed Sales Trends',
      icon: Icons.trending_up_rounded,
    ),
    _PromptInsightData(
      questionHinglish: 'Tuesday ko sales kyun girti hain?',
      questionEnglish: 'Why do Tuesday sales drop consistently?',
      intentBadge: 'OPPORTUNITY DETECTED',
      badgeColor: AppColors.warning,
      answerTitle: 'Tuesday 4–7 PM slowdown: -24% drop',
      answerBody:
          'Pichle 4 consecutive Tuesdays ka data dikhata hai ki 4 PM se 7 PM ke beech footfall normal ₹13,800 ke mukable ₹10,488 ho jaata hai. Yeh ek high-impact opportunity hai.',
      metricPills: [
        {'label': 'Normal Baseline', 'value': '₹13,800'},
        {'label': 'Recent Average', 'value': '₹10,488'},
        {'label': 'Pattern Duration', 'value': '4 weeks'},
        {'label': 'Revenue Gap', 'value': '-₹3,312/week'},
      ],
      actionLabel: 'Explore Tuesday Opportunity',
      icon: Icons.access_time_filled_rounded,
    ),
    _PromptInsightData(
      questionHinglish: 'Which customers haven\'t returned recently?',
      questionEnglish: 'Which regular customers are inactive?',
      intentBadge: 'CUSTOMER RETENTION',
      badgeColor: Color(0xFF7C3AED),
      answerTitle: '18 loyal repeat customers inactive for 14+ days',
      answerBody:
          'Aapke regular customers mein se 18 log pichle 2 hafton se nahi aaye hain. Unka average monthly spend ₹850 raha hai. WhatsApp reminder offer se unhe wapas laya ja sakta hai.',
      metricPills: [
        {'label': 'At-Risk Customers', 'value': '18 accounts'},
        {'label': 'Avg Monthly Spend', 'value': '₹850/cust'},
        {'label': 'Recovery Potential', 'value': '₹15,300/mo'},
        {'label': 'Suggested Action', 'value': 'WhatsApp Ping'},
      ],
      actionLabel: 'Review Inactive Customers',
      icon: Icons.people_alt_rounded,
    ),
    _PromptInsightData(
      questionHinglish: 'Mere liye next kya karna chahiye?',
      questionEnglish: 'What should be my next commercial move?',
      intentBadge: 'ACTIONABLE EXPERIMENT',
      badgeColor: AppColors.success,
      answerTitle: 'Run a 3-Hour Combo Promotion next Tuesday',
      answerBody:
          'VyapaarPilot recommends: Agle Tuesday 4 PM - 7 PM 10% snack-and-tea bundle discount run karein. Isse ₹3,450 incremental sales aur footfall recovery projected hai.',
      metricPills: [
        {'label': 'Proposed Experiment', 'value': '10% Evening Combo'},
        {'label': 'Target Window', 'value': 'Tue 4–7 PM'},
        {'label': 'Projected Uplift', 'value': '+15% to +30%'},
        {'label': 'Controlled Risk', 'value': '3 Hours Only'},
      ],
      actionLabel: 'Launch Growth Experiment',
      icon: Icons.rocket_launch_rounded,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isDesktop = screenWidth >= 1024;
    final current = _prompts[_selectedPromptIndex];

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
                  horizontal: 12.0,
                  vertical: 4.0,
                ),
                decoration: BoxDecoration(
                  color: AppColors.lightBlue,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: const Text(
                  'CONVERSATIONAL BUSINESS COPILOT',
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
                'Don\'t learn complex dashboards.\nTalk directly to your business.',
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
                  'Small merchants shouldn\'t need SQL queries or business analysts. Ask plain questions in Hindi, English, or Hinglish — get grounded answers backed by your transactions.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: AppColors.textSecondary,
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 48.0),

              // Interactive layout: Question selector buttons + Active Insight Card
              if (isDesktop)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left list of questions
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: List.generate(_prompts.length, (index) {
                          final p = _prompts[index];
                          final isSelected = index == _selectedPromptIndex;
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: _buildPromptTile(p, isSelected, () {
                              setState(() => _selectedPromptIndex = index);
                            }),
                          );
                        }),
                      ),
                    ),
                    const SizedBox(width: 36.0),
                    // Right active insight card
                    Expanded(
                      flex: 6,
                      child: _buildActiveInsightCard(context, current),
                    ),
                  ],
                )
              else
                Column(
                  children: [
                    // Horizontal scrollable question chips
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(_prompts.length, (index) {
                          final p = _prompts[index];
                          final isSelected = index == _selectedPromptIndex;
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: ChoiceChip(
                              label: Text(p.questionHinglish),
                              selected: isSelected,
                              onSelected: (_) {
                                setState(() => _selectedPromptIndex = index);
                              },
                              selectedColor: AppColors.primary,
                              backgroundColor: AppColors.background,
                              labelStyle: TextStyle(
                                fontSize: 13.0,
                                fontWeight: isSelected
                                    ? FontWeight.bold
                                    : FontWeight.w500,
                                color: isSelected
                                    ? Colors.white
                                    : AppColors.textPrimary,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                side: BorderSide(
                                  color: isSelected
                                      ? AppColors.primary
                                      : AppColors.border,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    _buildActiveInsightCard(context, current),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPromptTile(
    _PromptInsightData data,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppRadius.roundedMedium,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.lightBlue.withValues(alpha: 0.5) : Colors.white,
          borderRadius: AppRadius.roundedMedium,
          border: Border.all(
            color: isSelected ? AppColors.secondaryBlue : AppColors.border,
            width: isSelected ? 2.0 : 1.0,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.secondaryBlue.withValues(alpha: 0.08),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.secondaryBlue : AppColors.background,
                shape: BoxShape.circle,
              ),
              child: Icon(
                data.icon,
                color: isSelected ? Colors.white : AppColors.textSecondary,
                size: 18,
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '"${data.questionHinglish}"',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? AppColors.primary : AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 2.0),
                  Text(
                    data.questionEnglish,
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              color: isSelected ? AppColors.secondaryBlue : AppColors.border,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActiveInsightCard(
    BuildContext context,
    _PromptInsightData data,
  ) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: AppRadius.roundedLarge,
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with simulated AI Copilot badge
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8.0,
            runSpacing: 6.0,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 4.0,
                ),
                decoration: BoxDecoration(
                  color: data.badgeColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Text(
                  data.intentBadge,
                  style: TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.6,
                    color: data.badgeColor,
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: AppColors.success,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    'Grounded in your DB',
                    style: TextStyle(
                      fontSize: 11.0,
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),

          // Answer Title
          Text(
            data.answerTitle,
            style: const TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),

          // Plain language answer
          Text(
            data.answerBody,
            style: const TextStyle(
              fontSize: 13.5,
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ),
          const SizedBox(height: AppSpacing.xl),

          // Key metrics grid
          Wrap(
            spacing: AppSpacing.md,
            runSpacing: AppSpacing.sm,
            children: data.metricPills.map((m) {
              return Container(
                width: 120,
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: AppRadius.roundedSmall,
                  border: Border.all(color: AppColors.border),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      m['label']!,
                      style: const TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      m['value']!,
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: AppSpacing.xl),

          // Action button navigating into dashboard
          OutlinedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, AppRouter.dashboard);
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.primary,
              side: const BorderSide(color: AppColors.border, width: 1.5),
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.lg,
                vertical: AppSpacing.md,
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: AppRadius.roundedSmall,
              ),
            ),
            icon: const Icon(Icons.arrow_forward_rounded, size: 16),
            label: Text(
              data.actionLabel,
              style: const TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PromptInsightData {
  final String questionHinglish;
  final String questionEnglish;
  final String intentBadge;
  final Color badgeColor;
  final String answerTitle;
  final String answerBody;
  final List<Map<String, String>> metricPills;
  final String actionLabel;
  final IconData icon;

  const _PromptInsightData({
    required this.questionHinglish,
    required this.questionEnglish,
    required this.intentBadge,
    required this.badgeColor,
    required this.answerTitle,
    required this.answerBody,
    required this.metricPills,
    required this.actionLabel,
    required this.icon,
  });
}
