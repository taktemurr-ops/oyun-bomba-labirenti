import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_bomba_labirenti/oyun_bomba_labirenti.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(bombaConfig.title.length, 33);
    expect(bombaConfig.tagline.length, 33);
    for (final s in bombaConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler üretilir ve bot tarafından geçilir', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(bombaRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: bombaId, optionalMechanics: bombaRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(bombaRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
