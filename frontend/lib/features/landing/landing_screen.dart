import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import 'widgets/ask_business_section.dart';
import 'widgets/differentiation_section.dart';
import 'widgets/faq_section.dart';
import 'widgets/features_section.dart';
import 'widgets/growth_loop_section.dart';
import 'widgets/hero_section.dart';
import 'widgets/human_story_section.dart';
import 'widgets/landing_footer.dart';
import 'widgets/landing_nav_bar.dart';
import 'widgets/problem_section.dart';
import 'widgets/product_showcase_section.dart';
import 'widgets/value_strip_section.dart';
import 'widgets/voice_agent_section.dart';

/// Premium Public Landing Page for VyapaarPilot.
/// Designed for 15-second hackathon judge comprehension and high-trust Indian fintech aesthetics.
class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _productKey = GlobalKey();
  final GlobalKey _growthLoopKey = GlobalKey();
  final GlobalKey _featuresKey = GlobalKey();
  final GlobalKey _voiceAiKey = GlobalKey();
  final GlobalKey _faqKey = GlobalKey();
  final GlobalKey _whyKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToKey(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        top: true,
        bottom: false,
        child: Column(
          children: [
            // Sticky top navigation bar
            LandingNavBar(
              onProductTap: () => _scrollToKey(_productKey),
              onHowItWorksTap: () => _scrollToKey(_growthLoopKey),
              onFeaturesTap: () => _scrollToKey(_featuresKey),
              onVoiceAiTap: () => _scrollToKey(_voiceAiKey),
              onFaqTap: () => _scrollToKey(_faqKey),
            ),

            // Scrollable body containing all structured sections
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    // Section 1: Hero
                    HeroSection(
                      onHowItWorksTap: () => _scrollToKey(_growthLoopKey),
                    ),

                    // Section 2: Compact Trust & Value Strip (Understand • Discover • Act • Talk)
                    const ValueStripSection(),

                    // Section 3: The Problem (Visibility Gap)
                    const ProblemSection(),

                    // Section 4: "Ask Your Business" (Interactive Conversational UI)
                    const AskBusinessSection(),

                    // Section 5: Signature Growth Loop (01 DETECT -> 02 EXPLAIN -> 03 ACT -> 04 MEASURE)
                    GrowthLoopSection(key: _growthLoopKey),

                    // Section 6: Realistic Product Showcase & Evidence Box
                    ProductShowcaseSection(key: _productKey),

                    // Section 7: Multilingual Conversational Agent (Hindi, English, Hinglish + Voice Waveform)
                    VoiceAgentSection(key: _voiceAiKey),

                    // Section 8: Comprehensive 6-Pillar Feature Grid
                    FeaturesSection(key: _featuresKey),

                    // Section 9: Human / Merchant-Centric Story (Behind the Counter)
                    const HumanStorySection(),

                    // Section 10: Differentiation & Final Conversion CTA
                    DifferentiationSection(key: _whyKey),

                    // Section 11: Interactive FAQ Accordion
                    FaqSection(key: _faqKey),

                    // Section 12: Footer
                    const LandingFooter(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
