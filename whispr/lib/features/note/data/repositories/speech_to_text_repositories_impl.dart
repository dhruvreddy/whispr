import 'package:whispr/features/note/data/datasources/speech_to_text_data_source.dart';
import 'package:whispr/features/note/domain/entities/speech_result.dart';

import '../../../../injection.dart';
import '../../domain/repositories/speech_to_text_repositories.dart';

final class SpeechToTextRepositoriesImpl implements SpeechToTextRepositories {
  final _speechToText = injection<SpeechToTextDataSource>();
  @override
  Future<bool> initialize() async {
    return await _speechToText.initialize();
  }

  @override
  Stream<SpeechResult> listen() async* {
    yield* _speechToText.listen();
  }

  @override
  Future<void> stop() async {
    return _speechToText.stop();
  }
}
