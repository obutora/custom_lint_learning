library lint_learning;

import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:lint_learning/assist/button_assist.dart';
import 'package:lint_learning/assist/hoge_assist.dart';

import 'lint/avoid_direct_call.dart';
import 'lint/hoge_rule.dart';

PluginBase createPlugin() => _HogeLinter();

// Lint Ruleを登録するためのクラス
class _HogeLinter extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) {
    return [
      const HogeRule(),
      const AvoidDirectCallRule(),
    ];
  }

  @override
  List<Assist> getAssists() => [
        HogeAssist(),
        ButtonAssist(),
      ];
}
